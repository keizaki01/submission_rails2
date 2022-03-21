class UsersController < ApplicationController
before_action :authenticate_user!, only: [:mypage, :edit, :update]
before_action :set_user, only: [:show, :edit, :update]

  def mypage
    redirect_to user_path(current_user)
  end


  def show
    @user = current_user
  end

  def edit
  
  end

  def update
  @user = current_user
   if @user.update(params.require(:user).permit(:name, :email, :comment, :avatar))
    redirect_to top_rooms_path
   else
    render "edit"
   end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.fetch(:user, {}).permit(:name)
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end 

  
end
