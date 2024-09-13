class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resources)
    articles_path
  end

  def configure_permitted_parameters
    attributes = [:email, :password, :avatar, :name]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end
end
