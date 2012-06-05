class SaleTransaction < ActiveRecord::Base
  # ASSOCIATIONS
  belongs_to :sale

  # VALIDATIONS
  validates_associated :sale
  validates :sale_id, presence:  true
  validates :article_id, presence:  true
  validates :quantity_articles, presence:  true, inclusion: {in: 0..10}, numericality: {integer: true}
  validates :article_total_price, presence:  true, numericality: {greater_than: 0, integer: true}
  validates :article_unit_price_sold, presence:  true, numericality: {greater_than: 0, integer: true}

  attr_accessible :article_id, :article_total_price, :article_unit_price_sold, :quantity_articles, :sale_id
end
