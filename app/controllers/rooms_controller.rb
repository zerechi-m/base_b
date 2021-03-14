class RoomsController < ApplicationController
  before_action :authenticate_team!
  
  def index 
    
  end
  
  def create
    @room = Room.new(room_params)
    if @room.valid?
      @room.save
      redirect_to action: :index
    else
      render root_path
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, team_ids: [])
  end
end
