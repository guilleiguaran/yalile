# == Schema Information
#
# Table name: sale_transactions
#
#  id                      :integer          not null, primary key
#  sale_id                 :integer
#  article_id              :integer
#  quantity_articles       :integer
#  status                  :integer
#  article_unit_price_sold :float
#  article_total_price     :float
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class SaleTransaction < ActiveRecord::Base

  paginates_per 10
  
  # ASSOCIATIONS
  belongs_to :sale
  belongs_to :article

  # VALIDATIONS
  validates_associated :sale
  validate :article_id_existance
  validate :enough_articles
  validates :article_id, presence: true
  validates :status, presence: true
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

  def self.summary(params={})
    where{
      (status == 0) & (article_id == params[:article_id]) &
      (created_at >= params[:summary_date].to_datetime.at_beginning_of_month) &
      (created_at <= params[:summary_date].to_datetime.at_end_of_month)
    }.order{created_at.desc}
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
