class StocksController < ApplicationController

  def index
    @search = Article.search(params[:q])
    @articles = @search.result.group{[product_id, id]}.order{created_at.desc}.page(params[:page])
  end

end