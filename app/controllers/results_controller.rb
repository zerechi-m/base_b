class ResultsController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
    @teams = @game.teams.includes(:members)
    @home_team = @teams.select{|team| team.id == params[:team_id].to_i }[0]
    @home_team_mem = @home_team.members
    @away_team = @teams.select{|team| team.id != params[:team_id].to_i }[0]
  end

  def create

  end
end
