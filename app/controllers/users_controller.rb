class UsersController < ApplicationController
  
  # index page for all users
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  # new user
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
      render 'new' # if user doesnt save, render a new user page
    end
  end
  
  # edit users info
  def edit
    @user = User.find(params[:id])
  end
  
  # update users info
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Your account was updated   successfully!'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  # show users info
  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  
  # privatize methods
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end