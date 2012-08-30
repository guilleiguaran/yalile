class ReportsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @search = SaleTransaction.search(params[:q])
    @sale_transactions = @search.result.report
  end
end