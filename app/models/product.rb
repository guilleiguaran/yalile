class Product < ActiveRecord::Base

  # VALIDATIONS
  validates :name, :presence => true
  validates :name, :uniqueness => true

end
