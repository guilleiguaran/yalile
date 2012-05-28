class ArticlesController < ApplicationController

  def index
    pi = params[:product_id]
    @articles = Article.joins{product}.where{product_id == pi}.page(params[:page])
    if request.xhr?
      render json: {html: render_to_string(partial: "table", layout: false)}
    end
  end
  
  def new
    @product = Product.find_by_id(params[:product_id])
    @article = Article.new
    render json: {html: render_to_string(:new, layout: false)}
  end

end
