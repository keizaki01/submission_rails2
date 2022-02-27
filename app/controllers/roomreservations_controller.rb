class RoomreservationsController < ApplicationController
  def index
    @roomreservations = Roomreservation.all
  end

  def new
    @roomreservation = Roomreservation.new
  end

  def create
    # @roomreservation = Roomreservation.new(params.require(:roomreservation).permit(:start_date,:end_date,:person_num).merge(room_id:room.id))

    @roomreservation = current_user.roomreservations.create(roomreservation_params)
     redirect_to root_path 
  end
  private
  def roomreservation_params
    params.require(:roomreservation).permit(:start_date, :end_date, :room_id)
  end 

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
