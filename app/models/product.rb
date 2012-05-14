class Product < ActiveRecord::Base

  # CALLBACKS
  before_destroy AvoidDestroy

  # VALIDATIONS
  validates :name, :presence => true
  validates :name, :uniqueness => true

end
# == Schema Information
#
# Table name: products
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

