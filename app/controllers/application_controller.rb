class ApplicationController < ActionController::Base
  include SessionHelper
  include ApplicationHelper
  protect_from_forgery
  
  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(*User::ACCESSABLE_ATTRS) }
  end
end
