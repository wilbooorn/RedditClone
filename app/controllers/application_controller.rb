class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    @current_user ? @current_user : nil
  end

  def require_login
    redirect_to new_session_url unless current_user
  end
end
