class MessagesController < ApplicationController
  def index
      @message = Message.new
      @room = Room.find(params[:room_id])
      @messages = @room.messages.includes(:team)
  end

  def create
    
  end
end
