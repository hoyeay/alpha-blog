class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # make these methods available in templates as a helper
  helper_method :current_user, :logged_in?
  
  # if @current_user id undefined, 
  # define @current_user as User.find(session[:user_id]) if session[:user_id] applies,
  # otherwise use @current_user if defined
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  # get the boolean value of current_user (NOT the object)
  def logged_in?
    !!current_user
  end
  
  # if user is NOT (!) logged in
  def require_user
    if !logged_in?
      # flash message
      flash[:danger] = "You must be logged in to perform that action."
      # and redirect to index page
      redirect_to root_path
    end
  end
end
