class MembersController < ApplicationController
  def index
    @team = Team.find(params[:team_id])

  end

  def new
    @member = Member.new
    @team = Team.find(params[:team_id])
  end

  def create

  end
end

