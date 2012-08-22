# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sale < ActiveRecord::Base

  paginates_per 10

  # ASSOCIATIONS
  belongs_to :user
  has_many :sale_transactions
  has_many :articles, :through => :sale_transactions

  accepts_nested_attributes_for :sale_transactions
  attr_accessible :user_id, :total, :total_articles, :sale_transactions_attributes

  # VALIDATIONS
  validates :user_id, presence: true
  validates :total_articles, presence: true
  validates :total, presence: true

  # CALLBACKS
  before_destroy AvoidDestroy

  def transactions_by_status(current_status=0)
    self.sale_transactions.where{status == current_status}
  end

  def salesman
    self.user.username
  end

end
