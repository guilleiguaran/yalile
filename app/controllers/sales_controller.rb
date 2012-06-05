class SalesController < ApplicationController

  def index
  end
  
  def new
    @products = ["HOLA"]
    @sale = Sale.new
    @sale.sale_transactions.build
  end

end
