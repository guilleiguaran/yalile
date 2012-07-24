class Sale < ActiveRecord::Base

  paginates_per 10

  # ASSOCIATIONS
  has_many :sale_transactions
  has_many :articles, :through => :sale_transactions

  accepts_nested_attributes_for :sale_transactions
  attr_accessible :salesman, :sale_transactions_attributes

  # VALIDATIONS
  validates :salesman, :presence => true

  # CALLBACKS
  before_destroy AvoidDestroy

  def transactions_by_status(current_status=0)
    self.sale_transactions.where{status == current_status}
  end

  def total_of_sale
    transactions_by_status.sum(:article_total_price)
  end

end
# == Schema Information
#
# Table name: sales
#
#  id         :integer(4)      not null, primary key
#  salesman   :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
# Indexes
#
#  index_sales_on_salesman  (salesman)
#

