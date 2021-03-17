class MessagesController < ApplicationController
  before_action :authenticate_team!
  before_action :team_match 

  def index
      @message = Message.new
      @room = Room.find(params[:room_id])
      @messages = @room.messages.includes(:team)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.valid?
      @message.save
      redirect_to action: :index
    else
      @messages = @room.messages.includes(:team)
      flash.now[:alert] = "メッセージの送信が失敗しました! 空白を無くしてください"
      render :index
    end
  end

  def destroy
    room = Room.find(params[:room_id])
    message = room.messages.find(params[:id])
    message.destroy
    flash[:alert] = "対戦申込を削除しました"
    redirect_to action: :index
  end

  private
  def team_match
    redirect_to root_path unless current_team.id == params[:team_id].to_i
  end

  def message_params
    params.require(:message).permit(:content, :game_day, :game_time, :stadium,:address,:room_id).merge(team_id: current_team.id)
  end
end
