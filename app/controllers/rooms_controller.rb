class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    # @rooms = Room.where(user_id:current_user.id)

    

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name,:comment,:price,:address,:room_image).merge(user_id: current_user.id))
    if @room.save
      redirect_to rooms_path
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @user = User.find_by(id:@room.user_id)
  end

  def edit
    @room = Room.find(params[:id])
    @user = User.find_by(id:@room.user_id)
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:room_name,:comment,:price,:address,:room_image).merge(user_id: current_user.id))
    redirect_to rooms_path
    else
     render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_index_path
  end

  def search
    @rooms = Room.search(params[:search])
  end
end
end
