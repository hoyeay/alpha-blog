class PagesController < ApplicationController
  
  # display articles listing if a user is logged in,
  # otherwise display index page
  def home
    redirect_to articles_path if logged_in?
  end
  
  # display about page
  def about

  end
end