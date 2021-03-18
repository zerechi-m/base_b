class GamesController < ApplicationController
  before_action :team_match
  def index

  end

  def create
    @game = Game.new(game_params)
    if @game.valid?
      @game.save
      redirect_to action: :index
    else
      render "messages/index"
    end
  end

  private
  def team_match
    redirect_to root_path unless current_team.id == params[:team_id].to_i
  end
  
  def game_params
    params.permit(:game_day, :game_time, :stadium, :address, team_ids: [])
  end
end
