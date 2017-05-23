class SessionsController < ApplicationController
  
  # user new log in state
  def new
    
  end
  
  # create login for user
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in."
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login information."
      render 'new'
    end
  end
  
  # logout user state
  def destroy
    session[:user_id] = nil
    flash[:success] = "You've logged out."
    redirect_to root_path
  end
  
end