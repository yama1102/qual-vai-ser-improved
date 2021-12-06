class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :alert
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || profiles_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :photo])
  end

end
