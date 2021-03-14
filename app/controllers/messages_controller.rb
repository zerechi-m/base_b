class MessagesController < ApplicationController
  def index
      @message = Message.new
      @room = Room.find(params[:room_id])
      @messages = @room.messages.includes(:team)
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      @message.save
      redirect_to :index
    else
      @room = Room.find(params[:room_id])
      @messages = @room.messages.includes(:team)
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :game_day, :address)
  end
end
