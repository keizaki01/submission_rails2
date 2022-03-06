class RoomreservationsController < ApplicationController
  def index
    @roomreservations = Roomreservation.all
    # @roomreservations = Roomreservation.where(user_id:current_user.id)
    # binding.pry
  end

  def new
    @room = Room.find(params[:room_id])
    @users = current_user.id
    @roomreservation = Roomreservation.new
    # binding.pry
  end

  def confirm
    @room = Room.find(params[:room_id])
    @users = current_user.id
    @roomreservation = Roomreservation.new(roomreservation_params)
    # binding.pry
  end
  

  def create
    @roomreservation = Roomreservation.new(roomreservation_for_create_params)
    # binding.pry
    if @roomreservation.save
       redirect_to mypage_path 
    else
       render reservations_index_path
    end
  end

  private
  def roomreservation_params
    params.permit(:start_date, :end_date, :person_num, :room_id, :user_id, :room_name, :comment, :room_image)
  end 

  private
  def roomreservation_for_create_params
    params.require(:roomreservation).permit(:start_date, :end_date, :person_num, :room_id, :user_id, :room_name, :comment, :room_image)
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
