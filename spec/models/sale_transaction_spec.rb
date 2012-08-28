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

require 'spec_helper'

describe SaleTransaction do
  pending "add some examples to (or delete) #{__FILE__}"
end
