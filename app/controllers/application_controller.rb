class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    top_rooms_path
  end
  def after_sign_out_path_for(resource)
    top_rooms_path
  end
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end



end

