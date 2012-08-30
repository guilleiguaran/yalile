class SalesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @search = Sale.search(params[:q])
    @sales =  @search.result.page(params[:page])
    if request.xhr?
      render json: {html: render_to_string(partial: "table")}
    end
  end

  def show
    @sale = Sale.find_by_id(params[:id])
    @saletransactions = @sale.transactions_by_status(0)
    @refundsaletransactions = @sale.transactions_by_status(1)
  end

  def new
    @articles = Article.where{in_stock > 0}
    @sale = Sale.new
    @sale.sale_transactions.build
  end

  def create
    @sale = Sale.new(params[:sale].merge!(user_id: current_user.id))
    SalesControl.complete_sale(@sale)
    if @sale.save
      SalesControl.reduce_article_stock(@sale)
      redirect_to @sale
    else
      redirect_to new_sale_path
    end
  end

end