class RoomsController < ApplicationController
  def top
    @user = current_user
  end  

  def index
    @user = current_user  
    @rooms = Room.all
    # binding.pry
    # @rooms = Room.where(user_id:current_user.id)

  def new
    @user = current_user  
    @room = Room.new
  end

  def create
    @user = current_user  
    @room = Room.new(params.require(:room).permit(:room_name,:comment,:price,:address,:room_image).merge(user_id: current_user.id))
    if @room.save
      redirect_to rooms_path
    else
      render "new"
    end
    # binding.pry
  end

  def show
    @user = current_user  
    @room = Room.find(params[:id])
    # @user = User.find_by(id:@room.user_id)
    # binding.pry
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
    @user = current_user  
    @rooms = Room.search(params[:search])
  end

  
end
end
