class Product < ActiveRecord::Base

  # CALLBACKS
  before_destroy AvoidDestroy

  # VALIDATIONS
  validates :name, :presence => true
  validates :name, :uniqueness => true

end
