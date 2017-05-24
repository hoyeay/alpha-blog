class SessionsController < ApplicationController
  
  # display login page
  def new 
  end
  
  # create login for user
  def create
    # set/find user to the user's email (downcased) 
    user = User.find_by(email: params[:session][:email].downcase)
    # if user is defined and authenticated, create login
    if user && user.authenticate(params[:session][:password])
      # create user session
      session[:user_id] = user.id
      # flash message
      flash[:success] = "You have successfully logged in."
      # redirect user to user's profile
      redirect_to user_path(user)
    else
      # flash message if user login fails
      flash.now[:danger] = "There was something wrong with your login information."
      # render login page again
      render 'new'
    end
  end
  
  # destroy the user session
  def destroy
    # set user_id to nil, so user is removed from session
    session[:user_id] = nil
    # flash message
    flash[:success] = "You've logged out."
    # redirect to index page
    redirect_to root_path
  end
  
end