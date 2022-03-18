class UsersController < ApplicationController
before_action :authenticate_user!, only: [:mypage, :edit, :update]
before_action :set_user, only: [:show, :edit, :update]

  # def after_sign_in_path_for(resource)
  #   user_path(current_user)
  # end

  def mypage
    redirect_to user_path(current_user)
  end


  def show
    @user = current_user
    # @user = User.find(params[:id])
  end

  def edit
    # unless @user == current_user
    #  redirect_to user_path(@user)
    # end
  end

  def update
  #  if current_user.update(user_params)
  #    redirect_to user_path(current_user)
  #  else
  #    redirect_to edit_user_path(current_user)
  #  end
  @user = current_user
   if @user.update(params.require(:user).permit(:name, :email, :comment, :avatar))
    redirect_to mypage_path
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
