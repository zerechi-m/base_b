class MembersController < ApplicationController
  before_action :authenticate_team!, except: [:index, :show]
  before_action :member_match, only: [:edit, :update, :destroy]

  def index
    @team = Team.find(params[:team_id])
    @room = Room.new
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
    @member = Member.find(params[:id])
  end

  def edit
    # member_matchで インスタンスの生成・チームのオーナーのみ編集可能
  end

  def update
    # member_matchで インスタンスの生成・チームのオーナーのみ更新可能

    if @member.update(member_params)
      redirect_to team_member_path(@member.team_id, @member.id)
    else
      render action: :edit
    end
  end

  def destroy

    # member_matchで インスタンスの生成・チームのオーナーのみ削除可能

    if @member.destroy
      redirect_to team_members_path( params[:team_id])
    end
  end

  private

  def member_match
    @member = Member.find(params[:id])
    redirect_to team_members_path(@member.team_id) unless current_team.id == @member.team_id
  end

  def member_params
    params.require(:member).permit(:name, :uni_no, :dominant_hand_id, :position_id, :base_hist_id,
                                   :mem_image).merge(team_id: current_team.id)
  end
end
