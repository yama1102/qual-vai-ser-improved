class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :alert

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || profiles_path
  end
end
