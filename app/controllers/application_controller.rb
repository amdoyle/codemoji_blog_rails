class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?



  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |user_params|
      user_params.permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to '/posts' unless current_user
  end

end
