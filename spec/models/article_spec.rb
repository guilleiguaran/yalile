# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  description :text             default(""), not null
#  size        :string(255)      not null
#  in_stock    :integer          default(0)
#  code        :string(255)      not null
#  status      :integer
#  price       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_articles_on_code         (code) UNIQUE
#  index_articles_on_description  (description)
#  index_articles_on_size         (size)
#

require 'spec_helper'

describe Article do
  pending "add some examples to (or delete) #{__FILE__}"
end
