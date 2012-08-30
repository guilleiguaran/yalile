# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_products_on_name  (name) UNIQUE
#

class Product < ActiveRecord::Base
  
  paginates_per 1

  # ASOCIATIONS
  has_many :articles
  accepts_nested_attributes_for :articles

  # VALIDATIONS
  validates :name, presence: true, uniqueness: true

  attr_accessible :name, :articles_attributes

  # CALLBACKS
  before_destroy AvoidDestroy
  
  # ALIAS METHODS
  alias_method :code, :id
  
  # LOOKS A PRODUCT BY ITS ID IF CODE IS IN THE ARGS
  # OR BY ITS NAME IF THE CODE IN ARGS IS BLANK.
  def self.by_id_or_name(*args)
    params = args.slice!(0)
    if params[:code].blank?
      find_by_name(params[:name])
    else
      find_by_id(params[:code])
    end
  end

end
