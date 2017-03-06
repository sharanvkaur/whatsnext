class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def prevent_unauthorized_user_access
    redirect_to root_path, notice: 'sorry, you cannot access that page', status: :found unless logged_in?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user.nil? ? false : true
  end

  helper_method :current_user, :logged_in?
end
