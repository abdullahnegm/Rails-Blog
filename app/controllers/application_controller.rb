class ApplicationController < ActionController::Base

    before_action :authenticate_user!


    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}

        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password)}
    end

    helper_method :is_favourite?

    def is_favourite? post
        post ||= User.find(session[:user_id])
        current_user.favposts.include?(post)
    end
end
