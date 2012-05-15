class Article < ActiveRecord::Base

  # ASOCIATIONS
  belongs_to :product

  # VALIDATIONS
  validates :product_id, :presence => true
  validates :description, :presence => true
  validates :size, :presence => true
  validates :code, :presence => true, :uniqueness => true
  validates_associated :products

  # CALLBACKS
  before_destroy AvoidDestroy

  attr_accessible :code, :description, :in_stock, :product_id, :size, :status
end
