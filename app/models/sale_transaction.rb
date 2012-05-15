class SaleTransaction < ActiveRecord::Base
  # ASSOCIATIONS
  belongs_to :sale

  # VALIDATIONS
  validates :sale_id, :presence => true
  validates :article_id, :presence => true
  validates :quantity_articles, :presence => true, :numericallity => {:greater_than => 0, :only_integer => true}
  validates :article_total_price, :presence => true, :numericallity => {:greater_tah => 0}
  validates :article_uni_price_sold, :presence => true, :numericallity => {:greater_than => 0}
  validates_associated :sale

  attr_accessible :article_id, :article_total_price, :article_unit_price_sold, :quantity_articles, :sale_id
end
