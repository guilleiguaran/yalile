class ReportsController < ApplicationController

  def index
    parse_search_parameters(params[:search])
    @sale_transactions = SaleTransaction.report(params[:search])
  end
end