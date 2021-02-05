class ApplicationController < ActionController::Base

  # this will make current_user available to the views. Views
  # normally have access to methods defined in helper files, but
  # for a view to access a controller method we have to do this
  helper_method :current_user, :logged_in?

  def current_user
    # use memoization to return a current_user if we already have one
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # !! turns result to boolean
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

end
