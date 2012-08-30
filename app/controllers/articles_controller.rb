class ArticlesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_product, :only => [:index, :show, :new, :create]

  def index
    @search = @product.articles.search(params[:q])
    @articles = @search.result.page(params[:page])
    if request.xhr?
      render json: {html: render_to_string(partial: "table", layout: false)}
    end
  end
  
  def show
    @article = Article.find_by_id(params[:id])
  end
  
  def new
    @article = Article.new
    render json: {html: render_to_string(:new, layout: false)}
  end
  
  def create
    @article = @product.articles.new(params[:article])
    if @article.save
      render json: {status: "success"}
    else
      render json: {status: "error", errors: @article.errors}
    end
  end
  
  private
  
  def find_product
    @product = Product.find_by_id(params[:product_id])
  end

end