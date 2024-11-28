class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :role])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number])
  end

  # Add this method to redirect after sign in
  def after_sign_in_path_for(resource)
    if resource.role == 'worker'
      dashboard_path # Redirect to the worker dashboard
    else
      root_path # Redirect to the client dashboard or a default dashboard for other roles
    end
  end
end
