class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:clinica])
    devise_parameter_sanitizer.permit(:account_update, keys: [:endereco])
    devise_parameter_sanitizer.permit(:account_update, keys: [:telefone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:crm])
    devise_parameter_sanitizer.permit(:account_update, keys: [:cpf])
  end

end
