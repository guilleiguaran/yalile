class Product < ActiveRecord::Base

  # ASOCIATIONS
  has_many :articles

  # VALIDATIONS
  validates :name, :presence => true
  validates :name, :uniqueness => true

  # CALLBACKS
  before_destroy AvoidDestroy

  attr_accessible :name

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

