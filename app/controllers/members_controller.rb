class MembersController < ApplicationController
  before_action :authenticate_team!, except: [:index, :show]
  before_action :member_match, only: [:edit, :update]
  before_action :set_member, only: [:show, :edit, :update ]

  def index
    @team = Team.find(params[:team_id])
    @members = @team.members.order(position_id: "ASC")
  end

  def new
    @member = Member.new
    @team = Team.find(params[:team_id])
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to action: :index
    else
      @team = Team.find(params[:team_id])
      render action: :new
    end
  end

  def show
    # set_member でインスタンスの生成
  end

  def edit
    # set_member でインスタンスの生成
  end

  def update
    # set_member でインスタンスの生成

    if @member.update(member_params)
      redirect_to team_member_path(@member.team_id, @member.id)
    else
      render action: :edit
    end
  end

  private
  def set_member
    @member = Member.find(params[:id])
  end

  def member_match
    redirect_to team_members_path(params[:team_id]) unless current_team.id == @member.team_id
  end

  def member_params
    params.require(:member).permit(:name, :uni_no, :dominant_hand_id, :position_id, :base_hist_id,
                                   :mem_image).merge(team_id: current_team.id)
  end
end
