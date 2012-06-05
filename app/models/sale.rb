class Sale < ActiveRecord::Base
  # ASSOCIATIONS
  has_many :sale_transactions
  has_one :article, :through => :sale_transaction
  
  accepts_nested_attributes_for :sale_transactions
  attr_accessible :salesman, :sale_transactions_attributes

  # VALIDATIONS
  validates :salesman, :presence => true

  # CALLBACKS
  before_destroy AvoidDestroy
  
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

