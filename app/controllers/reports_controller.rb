class ReportsController < ApplicationController

  def index
    @sale_transactions = SaleTransaction.where{(status.eq 0)}.group{[article_id, sale_id]}.order{created_at.desc}
  end
end