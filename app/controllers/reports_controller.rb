class ReportsController < ApplicationController

  def index
    @search = SaleTransaction.search(params[:q])
    @sale_transactions = @search.result.report
  end
end