class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_params, :only => [:create]

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :sort_code, :account_number)}
  end
end
