class SalesController < ApplicationController

  def index
    @sales = Sale.where{}.page(params[:page])
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
    @sale = Sale.new(params[:sale].merge!(salesman: current_user.username))
    SalesControl.complete_sale(@sale)
    if @sale.save
      redirect_to new_sale_path
    else
      render :new
    end
  end

end
