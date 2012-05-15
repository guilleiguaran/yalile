class Sale < ActiveRecord::Base
  # ASSOCIATIONS
  has_many :sale_transactions
  has_one :article, :through => :sale_transaction

  # VALIDATIONS
  validates :salesman, :presence => true

  # CALLBACKS
  before_destroy AvoidDestroy
  attr_accessible :salesman
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

