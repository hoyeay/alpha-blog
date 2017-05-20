class ArticlesController < ApplicationController

  def index # list all articles in the Article DB
    @articles = Article.all
  end

  def new # create a new article for the Article DB
    @article = Article.new
  end

  def edit # edit an article
    @article = Article.find(params[:id])
  end

  def update # update the article and save
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = 'Article was successfully updated!'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def create # create the article and save it to the Article DB
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was successfully created!'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show # show the currently created and saved article
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end