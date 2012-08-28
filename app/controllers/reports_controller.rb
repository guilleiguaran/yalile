class ReportsController < ApplicationController

  def index
    @search = SaleTransaction.search(params[:q])
    if params[:q]
      @sale_transactions = @search.result.report
    else
      @sale_transactions = []
    end
  end
end