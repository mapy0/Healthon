class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :aim_w, :aim_bf, :aim_mus, :aim_sm, :height, :birth, :age, :sex, :self_introduction, :image_id])
  end
  
end
