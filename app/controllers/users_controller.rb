class UsersController < ApplicationController
  
  # applies the set_user method to edit, update, and show method
  before_action :set_user, only: [:edit, :update, :show]
  
  # applies the require_same_user method to edit and update method
  before_action :require_same_user, only: [:edit, :update]
  
  # index page for all users
  def index
    # show all users in increments of 5 users per page
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  # new user
  def new
    # create new user for User DB
    @user = User.new
  end
  
  # create new user
  def create
    # create new user with form parameters
    @user = User.new(user_params)
    if @user.save
      # if user is saved to User DB, apply the user.id to the session
      session[:user_id] = @user.id
      # flash message when user is saved
      flash[:success] = "Welcome to the Alpha Blog #{@user.username}!"
      # redirect user to users profile
      redirect_to user_path(@user)
    else
      # if user is not saved, render the form again
      render 'new' # if user doesn't save, render a new user page
    end
  end
  
  # edit users info (used to display the user edit page)
  def edit
  end
  
  # update users info
  def update
    # if the updated user info saves to the User DB
    if @user.update(user_params)
      # flash message
      flash[:success] = 'Your account was updated   successfully!'
      # redirect user to user's profile
      redirect_to user_path(@user)
    else
      # if the update fails, render the edit form again
      render 'edit'
    end
  end
  
  # show user's articles in increments of 5 per page
  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  
  # methods that can only be used by the methods of the users_controller class
  private
  
  # establish the forms parameters for a user
  def user_params
    # the username, email, and password from the form partial
    params.require(:user).permit(:username, :email, :password)
  end
  
  # sets the user by the id to a few methods, listed above
  def set_user
    @user = User.find(params[:id])
  end
  
  # requires the user editing or updating to be the user
  def require_same_user
    # if the user is on another user's edit or update page
    if current_user != @user
      # flash message
      flash[:danger] = "Access denied."
      # and redirect to articles listing
      redirect_to articles_path
    end
  end
end