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
  private

  def set_result
    @game = Game.find(params[:game_id])
    @teams = @game.teams.includes(:members)
    @home_team = @teams.select{|team| team.id == current_team.id }[0]
    @home_order = @home_team.orders.where(team_id: @home_team.id, game_id: params[:game_id])
    @home_team_mem = @home_team.members
    @away_team = @teams.select{|team| team.id != current_team.id }[0]
    @away_order = @away_team.orders.where(team_id: @away_team.id, game_id: params[:game_id])
  end

  def result_params
    params.permit(:batting_first, :fielding_first).merge(game_id: params[:game_id])
  end
end
