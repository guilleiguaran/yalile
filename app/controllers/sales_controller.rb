class SalesController < ApplicationController

  def index
  end
  
  def new
    @articles = Article.all
    @sale = Sale.new
    @sale.sale_transactions.build
  end
  
  def create
    @sale = Sale.new(params[:sale])
    SalesControl.complete_sale(@sale)
    p @sale.sale_transactions
    redirect_to false
  end

end
