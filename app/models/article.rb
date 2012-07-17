class Article < ActiveRecord::Base

  paginates_per 3

  attr_accessible :code, :description, :in_stock, :product_id, :size, :status, :price

  # ASOCIATIONS
  belongs_to :product

  # VALIDATIONS
  validates_associated :product
  # validates :product_id, presence: true
  # validates :description, presence: true
  validates :size, presence: true, format: {with: /^[a-z0-9]*$/i}
  validates :code, presence: true, uniqueness: true, format: {with: /^[a-z0-9]*$/i}
  validates :in_stock, presence: true, inclusion: {in: 1..100}
  validates :price, presence: true, numericality: {greater_than: 0}

  # CALLBACKS
  before_destroy AvoidDestroy

end
# == Schema Information
#
# Table name: articles
#
#  id          :integer(4)      not null, primary key
#  product_id  :integer(4)
#  description :text            default(""), not null
#  size        :string(255)     not null
#  in_stock    :integer(4)      default(0)
#  code        :string(255)     not null
#  status      :integer(4)
#  price       :integer(4)      not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

