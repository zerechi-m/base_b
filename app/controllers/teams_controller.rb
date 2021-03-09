class TeamsController < ApplicationController
  before_action :authenticate_team!, except: :index

  def index
    
  end



  def edit
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
  def update_params
    params.require(:team).permit(:name, :rep_name)
  end
end
