class Item < ActiveRecord::Base
end
# == Schema Information
#
# Table name: items
#
#  id          :integer(4)      not null, primary key
#  product_id  :integer(4)      not null
#  description :text
#  size        :string(255)     not null
#  in_stock    :integer(4)      default(0), not null
#  code        :string(255)     not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

