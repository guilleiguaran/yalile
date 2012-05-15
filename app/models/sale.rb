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
