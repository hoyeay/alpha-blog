class UsersController < ApplicationController
  # new
  def new
    @user = User.new
  end
  # create new user
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Alpha Blog #{@user.username}!"
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end