# articles controller
class ArticlesController < ApplicationController
  # apply set_article from private to these methods ONLY
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  # display all articles
  def index
    @articles = Article.all
  end

  # create a new article for the Article DB
  def new
    @article = Article.new
  end

  # edit an article
  def edit
  end

  # update the article and save
  def update
    set_article
    if @article.update(article_params)
      flash[:notice] = 'Article was successfully updated!'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  # create the article and save it to the Article DB
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was successfully created!'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  # show the currently created and saved article
  def show
  end

  # find and destroy article
  def destroy
    @article.destroy
    flash[:notice] = 'Article was successfully deleted. :('
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end