class ApplicationController < ActionController::Base
  # def after_sign_in_path_for(resource)
  #   reservations_index_path
  # end
  def after_sign_out_path_for(resource)
    reservations_index_path
  end
  protect_from_forgery with: :exception

  

  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end



end

