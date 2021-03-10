class TeamsController < ApplicationController
  before_action :authenticate_team!, except: [:index, :show]
  before_action :set_team, only: [:edit, :show, :update]
  before_action :team_match, only: [:edit, :update]

  def index
    
  end

  def show #set_teamで @teamを作成
    
  end


  def edit #set_teamで @teamを作成
    
  end

  def update
    if current_team.update(update_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  private
  def set_team
    @team = Team.find(params[:id])
  end

  def team_match
    unless current_team.id == @team.id
      redirect_to root_path
    end
  end

  def update_params
    params.require(:team).permit(:name, :rep_name, :email, :image)
  end
end
