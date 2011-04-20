class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  protected
  def authenticate(user)
    session[:user_id] = user.id
  end
  def require_authentication
    unless current_user
      flash[:error] = 'You must to be logged in'
      redirect_to new_session_url
    end
  end
end
