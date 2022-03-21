class RoomreservationsController < ApplicationController

  def index
    @user = current_user  
    @roomreservations = Roomreservation.all
  end

  def new
    @room = Room.find(params[:room_id])
    @user = current_user 
    @users = current_user.id
    @roomreservation = Roomreservation.new
  end

  def confirm
    @room = Room.find(params[:room_id])
    @user = current_user 
    @users = current_user.id
    @roomreservation = Roomreservation.new(roomreservation_for_create_params)
    @day = (@roomreservation.end_date &.- @roomreservation.start_date) &./ 86400
    @total_price = @roomreservation.person_num &.* @roomreservation.price &.* @day
    render :new if @roomreservation.invalid?
  end
  
  def create
    @user = current_user 
    @roomreservation = Roomreservation.new(roomreservation_for_create_params)
    if @roomreservation.save
       redirect_to  room_roomreservations_path 
    else
       render top_rooms_path
    end
  end

  def edit
    @user = current_user 
    @users = current_user.id
    @room = Room.find(params[:room_id])
    @roomreservation = Roomreservation.find(params[:id])
    @day = (@roomreservation.end_date &.- @roomreservation.start_date) &./ 86400
    @total_price = @roomreservation.person_num &.* @roomreservation.price &.* @day
  end

  def update
    @user = current_user 
    @room = Room.find(params[:room_id])
    @roomreservation = Roomreservation.find(params[:id])
    if @roomreservation.update(roomreservation_for_create_params)
    redirect_to roomreservations_index_path
    else
     render "edit"
    end
  end

  def destroy
    @user = current_user 
    @room = Room.find(params[:room_id])
    @roomreservation = Roomreservation.find(params[:id])
    @roomreservation.destroy
    redirect_to roomreservations_index_path
  end

  private
  def roomreservation_for_create_params
    params.require(:roomreservation).permit(:start_date, :end_date, :person_num, :room_id, :user_id, :room_name, :comment, :room_image, :price, :total_price)
  end 

  def roomreservation_for_edit_params
    params.permit(:start_date, :end_date, :person_num, :room_id, :user_id, :room_name, :comment, :room_image, :price, :total_price)
  end 

end