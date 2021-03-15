class MessagesController < ApplicationController
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
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :game_day, :address,:room_id).merge(team_id: current_team.id)
  end
end
