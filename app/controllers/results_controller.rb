class ResultsController < ApplicationController

  def index
    set_result    # 変数をセット
  end

  def create
    @result = Result.new(result_params)
    if @result.valid?
      @result.save
      redirect_to root_path
    else
      set_result           # 変数をセット
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

  def set_result
    @game = Game.find(params[:game_id])
    @teams = @game.teams.includes(:members)
    @home_team = @teams.select{|team| team.id == current_team.id }[0]
    @home_order = @home_team.orders.where(team_id: @home_team.id, game_id: params[:game_id])
    @home_team_mem = @home_team.members
    @away_team = @teams.select{|team| team.id != current_team.id }[0]
    @away_order = @away_team.orders.where(team_id: @away_team.id, game_id: params[:game_id])

    @batting_first = @game.teams.where(name: @game.result.batting_first)[0]
    @fielding_first = @game.teams.where(name: @game.result.fielding_first)[0]

    # @first_num_of_times = first_num_of_times()
    # @second_num_of_times = second_num_of_times()
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
end
