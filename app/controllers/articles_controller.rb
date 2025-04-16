# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  before_action :find_article, only: [:show]

  def index
    articles = Article.order(published_at: :desc)
    render json: articles.map(&:as_api_json)
  end

  def show
    if @article
      render json: @article.as_api_json
    else
      head :not_found
    end
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: article.as_api_json, status: :created
    else
      render json: { errors: article.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def method_not_allowed
    head :method_not_allowed
  end

  private

  def article_params
    params.permit(:title, :content, :author, :category, :published_at)
  end

  def find_article
    @article = Article.find_by(id: params[:id])
  end
end
