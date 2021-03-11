class MembersController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @members = @team.members
  end

  def new
    @member = Member.new
    @team = Team.find(params[:team_id])
  end

  def create
    binding.pry
    @member = Member.new(member_params)

    if @member.save
      redirect_to action: :index
    else
      @team = Team.find(params[:team_id])
      render action: :new
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  private

  def member_params
    params.require(:member).permit(:name, :uni_no, :dominant_hand_id, :position_id, :base_hist_id,
                                   :mem_image).merge(team_id: current_team.id)
  end
end
