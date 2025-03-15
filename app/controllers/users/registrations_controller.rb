class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
      %i[name surname email privacy]
    )
    devise_parameter_sanitizer.permit(:account_update, keys:
      %i[name surname email])
  end


  def after_inactive_sign_up_path_for(resource)
      root_path
  end
end
