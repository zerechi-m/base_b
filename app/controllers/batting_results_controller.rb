class BattingResultsController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
    @teams = @game.teams.includes(:members)
    @home_team = @teams.select{|team| team.id == current_team.id }[0]
    @home_order = @home_team.orders.where(team_id: @home_team.id, game_id: params[:game_id])
    @home_team_mem = @home_team.members
    @away_team = @teams.select{|team| team.id != current_team.id }[0]
    @away_order = @away_team.orders.where(team_id: @away_team.id, game_id: params[:game_id])
  end

  def create
    binding.pry
  end
end
