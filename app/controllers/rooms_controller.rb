class RoomsController < ApplicationController
  def top
    @user = current_user
  end  

  def index
    @user = current_user  
    @rooms = Room.all
  end

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
  end

  def show
    @user = current_user  
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
    @user = User.find_by(id:@room.user_id)
  end

  def update
    @user = current_user
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

  def tokyo
    @user = current_user  
    @rooms = Room.where(address: '東京').or(Room.where(room_name: '東京').or(Room.where(comment: '東京')))
  end

  def osaka
    @user = current_user  
    @rooms = Room.where(address: '大阪').or(Room.where(room_name: '大阪').or(Room.where(comment: '大阪')))
  end

  def kyoto
    @user = current_user  
    @rooms = Room.where(address: '京都').or(Room.where(room_name: '京都').or(Room.where(comment: '京都')))
  end

  def sapporo
    @user = current_user  
    @rooms = Room.where(address: '札幌').or(Room.where(room_name: '札幌').or(Room.where(comment: '札幌')))
  end

end
