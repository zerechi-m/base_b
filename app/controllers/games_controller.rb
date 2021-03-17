class GamesController < ApplicationController
  def index
    
  end

  def create
    binding.pry
    @game = Game.new(game_params)
    if @game.valid?
      @game.save
      redirect_to action: :index
    else
      render "messages/index"
    end
  end

  private

  def game_params
    params.permit(:game_day, :game_time, :stadium, :address, team_ids: [])
  end
end
