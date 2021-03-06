class ResultsController < ApplicationController
  before_action :authenticate_team!
  before_action :team_auth

  def index
    @result = Result.new
    set_result_first
  end

  def create
    @result = Result.new(result_params)
    if @result.valid?
      @result.save
      redirect_to team_game_batting_results_path(current_team.id, params[:game_id])
    else
      set_result_first           # 変数をセット
      flash[:alert] = "先攻・後攻を選択してください"
      render action: :index
    end
  end

  def update
    set_result
    result_update      # 試合結果を集計--------   
    @result = Result.find(params[:id])
    @result.update(win: @winner, lose: @loser, batting_first_point: @batting_first_point, fielding_first_point:  @fielding_first_point, game_id: params[:game_id])
    redirect_to  game_result_path(params[:game_id], params[:id])
  end

  def show
    set_result
    @game_result = @game.result
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

  def set_result_first
    @game = Game.find(params[:game_id])
    @teams = @game.teams.includes(:members, :batting_results)
    @home_team = @teams.select{|team| team.id == current_team.id.to_i }[0]
    @home_order = @home_team.orders.where(team_id: @home_team.id, game_id: params[:game_id])
    @home_team_mem = @home_team.members
    @away_team = @teams.select{|team| team.id != current_team.id.to_i }[0]
    @away_order = @away_team.orders.where(team_id: @away_team.id, game_id: params[:game_id])
  end

  def set_result
    @game = Game.find(params[:game_id])
    @teams = @game.teams.includes(:members, :batting_results)

    #------ 先攻チームと後攻チームを作成
    @batting_first = @game.teams.where(name: @game.result.batting_first)[0]
    @fielding_first = @game.teams.where(name: @game.result.fielding_first)[0]
    @batting_first_order = @batting_first.orders.where(team_id: @batting_first.id, game_id: params[:game_id])
    @fielding_first_order = @fielding_first.orders.where(team_id:  @fielding_first.id, game_id: params[:game_id])
    #------ 先攻チームと後攻チームのピッチャー結果
    @batting_first_pitcher = @batting_first.members.where(id: @batting_first_order.where(position_id: 1)[0].member_id)[0]
    @fielding_first_pitcher = @fielding_first.members.where(id: @fielding_first_order.where(position_id: 1)[0].member_id)[0]
    #------ 先攻チームと後攻チームの得点
    @batting_first_point = @batting_first.batting_results.where(game_id: @game.id).sum(:point_id)
    @fielding_first_point = @fielding_first.batting_results.where(game_id: @game.id).sum(:point_id)
    
    #------ 各イニングの得点
    @first_num_of_times = first_num_of_times()
    @second_num_of_times = second_num_of_times()
    
  end

  def result_update
    
    @batting_first_point = @batting_first.batting_results.where(game_id: @game.id).sum(:point_id)
    @fielding_first_point = @fielding_first.batting_results.where(game_id: @game.id).sum(:point_id)
    
    if @batting_first_point > @fielding_first_point
      @winner = @batting_first.name
      @loser = @fielding_first.name
    elsif @batting_first_point < @fielding_first_point
      @winner =@fielding_first.name
      @loser = @batting_first.name
    end
  end

  def result_params
    params.permit(:batting_first, :fielding_first).merge(game_id: params[:game_id])
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
