class ArticlesController < ApplicationController
  # apply set_article from private, below,  to these methods ONLY
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  # display all articles in the Article DB
  def index
    @articles = Article.all
  end

  # create a new article for the Article DB
  # @article is the instance variable for the new Article db
  def new
    @article = Article.new
  end

  # edit an article
  def edit # displays the edit.html.slim page with article form
  end

  # update the article and save
  def update
    if @article.update(article_params) # if article is updated
      flash[:success] = 'Article was successfully updated!' # flash message
      redirect_to article_path(@article) # redirect to article
    else
      render 'edit' # display the edit method/view (edit.html.slim)
    end
  end

  # create the article and save it to the Article DB
  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save # if article is saved
      flash[:success] = 'Article was successfully created!' # display flash message
      redirect_to article_path(@article) # redirect to created article
    else
      render 'new' # display the new method/view (new.html.slim)
    end
  end

  # show the currently created and saved article
  def show
  end

  # delete the article from Article DB
  def destroy
    @article.destroy # destroy article
    flash[:danger] = 'Article was successfully deleted.' # flash message
    redirect_to articles_path # redirect to all articles
  end

  # private methods can only be accessed within this class
  private
  # finds the current article id in the Article Db
  def set_article
    @article = Article.find(params[:id]) # obtain the currently Article's id from Article DB
  end
  # permit the title and description params onto the Article DB
  def article_params
    params.require(:article).permit(:title, :description)
  end
end