class TeamsController < ApplicationController
  before_action :authenticate_team!, except: :index
  before_action :team_match, only: [:edit]

  def index
    
  end



  def edit
    team_match
    @team = Team.find(current_team.id)
  end

  def update
    if current_team.update(update_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  private
  def team_match
    unless current_team.id == params[:id]
      redirect_to root_path
    end
  end

  def update_params
    params.require(:team).permit(:name, :rep_name)
  end
end
