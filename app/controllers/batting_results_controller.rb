class BattingResultsController < ApplicationController
  before_action :authenticate_team!
  before_action :team_auth
  

  def index
    set_batting_results
    @at_bat_batting_result = AtBatBattingResult.new  # form_objectを使用
    @no = num_params # 1 ~ 9番まで順番に打席を作る
   
  end

  def create
    # form_objectを使用
    @at_bat_batting_result = AtBatBattingResult.new(batting_params)

    unless overlapping <= 1
      set_batting_results
      @no = num_params
      flash[:alert] = "出塁欄に重複があります"
      render action: :index and return
    end

    if @at_bat_batting_result.valid?
      @at_bat_batting_result.save
      redirect_to action: :index
    else
      set_batting_results
      @no = num_params
      flash[:alert] = "出塁欄空白があります"
      render action: :index
    end
  end

  private 
  def team_auth
    game = Game.find(params[:game_id])
    team1 = game.teams.ids[0]
    team2 = game.teams.ids[1]
    unless current_team.id == team1 || current_team.id == team2
      redirect_to root_path
    end
  end


  def set_batting_results

    @game = Game.find(params[:game_id])
    @teams = @game.teams.includes(:members)
    @home_team = @teams.select{|team| team.id == params[:team_id].to_i }[0]
    @home_order = @home_team.orders.where(team_id: @home_team.id, game_id: params[:game_id])
    @home_team_mem = @home_team.members
    @away_team = @teams.select{|team| team.id != params[:team_id].to_i }[0]
    @away_order = @away_team.orders.where(team_id: @away_team.id, game_id: params[:game_id])
    @batter = @home_order

    @batting_first = @game.teams.where(name: @game.result.batting_first)[0]
    @fielding_first = @game.teams.where(name: @game.result.fielding_first)[0]
    
    @first_num_of_times = first_num_of_times()
    @second_num_of_times = second_num_of_times()
  end

  def batting_params
    params.require(:at_bat_batting_result).permit(:hit_id, :out_id, :time_base_id, :four_deadball_id, :point_id, :member_id, :order_id, :pitcher_id, :away_team_id).merge(game_id: params[:game_id], team_id: params[:team_id])
  end

  def overlapping
    array = []
    array <<  @at_bat_batting_result.hit_id
    array <<  @at_bat_batting_result.out_id
    array <<  @at_bat_batting_result.time_base_id
    array <<  @at_bat_batting_result.four_deadball_id
    array_count = array.select{|num| num.present?}.count
    return array_count
  end

  def num_params
    if @home_order.where(game_id: @game.id, batting_order: 1)[0].batting_results.present? == false
      return 1
    end
    
    last_order_id = @game.batting_results.where(team_id: @home_team.id).last.order.batting_order
    
    if last_order_id == 9
      return 1
    else
       return last_order_id + 1
    end
  end

  def first_num_of_times # 先攻チームの点数
    
    point_array = []
    @batting_first_results = @batting_first.batting_results.where(game_id: @game.id)
    batting_first_out = @batting_first_results.where(out_id: [1..6])

    batting_first_1st = @batting_first_results[0].id if @batting_first_results[0].present? # 初回のバッター表示分岐

    count = batting_first_out.length / 3
    i = 0
    
    count.times do
      i += 2
      three_out = batting_first_out[i].id
      point = @batting_first_results.where(id: [batting_first_1st..three_out]).sum(:point_id)
      point_array <<  point
      if  @batting_first_results.find_by("id > ?", three_out).present?
        batting_first_1st = @batting_first_results.find_by("id > ?", three_out).id
      end
      i += 1
    end

    unless count == 5
      last = @batting_first_results.last.id if @batting_first_results.last.present? # 初回のバッター表示分岐
      
      point = @batting_first_results.where(id: [batting_first_1st..last]).sum(:point_id)
      point_array << point if last != batting_first_1st #前の回の点数を保持を防ぐ
    end

    return point_array
  end

  def second_num_of_times  # 後攻チームの点数
    point_array = []
    @fielding_first_results = @fielding_first.batting_results.where(game_id: @game.id)
    fielding_first_out = @fielding_first_results.where(out_id: [1..6])
    
    fielding_first_1st = @fielding_first_results[0].id if @fielding_first_results[0].present? # 初回のバッター表示分岐

    count = fielding_first_out.length / 3
    i = 0
    
    count.times do
      i += 2
      three_out = fielding_first_out[i].id
      point = @fielding_first_results.where(id: [fielding_first_1st..three_out]).sum(:point_id)
      point_array <<  point

      if @fielding_first_results.find_by("id > ?", three_out).present?
        fielding_first_1st = @fielding_first_results.find_by("id > ?", three_out).id
      end
      i += 1
    end
    
    unless count == 5
      last = @fielding_first_results.last.id if @fielding_first_results.last.present? # 初回のバッター表示分岐

      point = @fielding_first_results.where(id: [fielding_first_1st..last]).sum(:point_id)
      point_array << point if last != fielding_first_1st #前の回の点数を保持を防ぐ
    end

    return point_array
  end

end

