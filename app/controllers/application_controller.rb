class ApplicationController < ActionController::Base
  include SessionHelper
  include ApplicationHelper
  protect_from_forgery
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(*User::ACCESSABLE_ATTRS) }
  end
end
