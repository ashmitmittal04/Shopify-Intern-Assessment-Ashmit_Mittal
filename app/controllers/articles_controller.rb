# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  # Set the article before performing actions like show, edit, update, or destroy
  before_action :set_article, only: %i[show edit update destroy]

  # Display a list of all articles
  def index
    @articles = Article.all
  end

  # Display details of a specific article
  def show
  end

  # Display a form for creating a new article
  def new
    @article = Article.new
  end

  # Create a new article based on the submitted form data
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # Display a form for editing an existing article
  def edit
  end

  # Update an existing article based on the submitted form data
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # Delete an existing article
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  # Search for articles based on a query parameter
  def search
    @query = params[:query]
    @results = Article.search(@query)
  end

  private

  # Set the @article instance variable based on the :id parameter
  def set_article
    @article = Article.find(params[:id])
  end

  # Define the permitted parameters for creating or updating an article
  def article_params
    params.require(:article).permit(:title, :content, :author, :date)
  end
end
