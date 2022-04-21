class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, :configure_permitted_update_parameters, if: :devise_controller?

    # This method used to redirect user to the products path after success sign_up/sign_in
    def after_sign_in_path_for(resource)
        products_path
    end

    # Catch all CanCan errors and alert the user of the exception
    rescue_from CanCan::AccessDenied do | exception |
        redirect_to products_path, alert: exception.message
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :gender, :phone_number, :profile_picture_url, :birthday, :address, :about, :is_admin])
    end
    protected
    def configure_permitted_update_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :gender, :phone_number, :profile_picture_url, :birthday, :address, :about, :is_admin])
    end
end