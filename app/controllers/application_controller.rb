class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def authenticate_user!
   if user_signed_in? != true
     redirect_to login_path
   end
  end

  def user_signed_in?
   current_user.present?
  end
end
