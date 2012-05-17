class Product < ActiveRecord::Base

  attr_accessible :name, :articles_attributes

  # ASOCIATIONS
  has_many :articles
  accepts_nested_attributes_for :articles

  # VALIDATIONS
  validates :name, :presence => true, :uniqueness => true

  # CALLBACKS
  before_destroy AvoidDestroy
  
  # ALIAS METHODS
  alias_method :code, :id

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

