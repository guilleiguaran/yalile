# == Schema Information
#
# Table name: sales
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  total_articles :integer          not null
#  total          :float            not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_sales_on_user_id  (user_id)
#

require 'spec_helper'

describe Sale do
  pending "add some examples to (or delete) #{__FILE__}"
end
