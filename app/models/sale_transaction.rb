class SaleTransaction < ActiveRecord::Base
  # ASSOCIATIONS
  belongs_to :sale
  belongs_to :article

  # VALIDATIONS
  validates_associated :sale
  validate :article_id_existance
  validate :enough_articles
  validates :article_id, presence: true
  validates :quantity_articles, presence:  true, inclusion: {in: 0..20}, numericality: {integer: true}
  validates :article_total_price, presence:  true, numericality: {greater_than: 0, integer: true}
  validates :article_unit_price_sold, presence:  true, numericality: {greater_than: 0, integer: true}

  # CALLBACKS
  before_destroy AvoidDestroy

  attr_accessible :article_id, :article_total_price, :article_unit_price_sold, :quantity_articles, :sale_id, :status

  def article_associated
    self.article
  end

  def article_stock(type)
    article = self.article
    case type.to_sym
    when :return
      article.update_attribute(:in_stock, article.in_stock + self.quantity_articles)
    when :sell
      article.update_attribute(:in_stock, article.in_stock - self.quantity_articles)
    end
  end

  private

  attr_reader :article_verified

  def article_id_existance
    article_verified = Article.find_by_id(self.article_id)
    if !article_verified
      errors.add(:article_id, "Este item no existe en la base de datos.")
    end
  end

  def enough_articles
    if article_verified && article_verified.in_stock < self.quantity_articles
      errors.add(:quantity_articles, "No hay suficientes articulos para vender.")
    end
  end
end
# == Schema Information
#
# Table name: sale_transactions
#
#  id                      :integer(4)      not null, primary key
#  sale_id                 :integer(4)
#  article_id              :integer(4)
#  quantity_articles       :integer(4)
#  article_unit_price_sold :float
#  article_total_price     :float
#  created_at              :datetime        not null
#  updated_at              :datetime        not null
#

