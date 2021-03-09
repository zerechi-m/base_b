class TeamsController < ApplicationController
  before_action :authenticate_team!, except: :index
  before_action :set_team, only: [:edit, :show]
  before_action :team_match, only: [:edit, :update]

  def index
    
  end

  def show

  end


  def edit
    
  end

  def update
    if current_team.update(update_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  private
  def set_team
    @team = Team.find(current_team.id)
  end

  def team_match
    binding.pry
    unless current_team.id == @team.id
      redirect_to root_path
    end
  end

  def update_params
    params.require(:team).permit(:name, :rep_name)
  end
end
