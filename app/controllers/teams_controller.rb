class TeamsController < ApplicationController
  before_action :authenticate_team!, except: [:index, :show]
  before_action :set_team, only: [:edit, :show, :update]
  before_action :team_match, only: [:edit, :update]

  def index
    if team_signed_in?
      @teams = Team.where.not(id: current_team.id).includes(:members).order(id: "ASC")
    else
      @teams = Team.all.order(id: "DESC")
    end
  end

  # set_teamで @teamを作成
  def show
  end

  # set_teamで @teamを作成
  def edit
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
    redirect_to root_path unless current_team.id == @team.id
  end

  def update_params
    params.require(:team).permit(:name, :rep_name, :email, :image)
  end
end
