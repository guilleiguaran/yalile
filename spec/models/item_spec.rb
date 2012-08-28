# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  product_id  :integer          not null
#  description :text
#  size        :string(255)      not null
#  in_stock    :integer          default(0), not null
#  code        :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_items_on_code                 (code) UNIQUE
#  index_items_on_product_id_and_size  (product_id,size)
#

require 'spec_helper'

describe Item do

  context "on CREATE" do
    context "with invalid attributes" do
      it "hola" do
        i = build(:item)
        p i
      end
    end
    context "with valid attributes" do
    end
  end

  context "on UPDATE" do
    context "with invalid attributes" do
    end
    context "with valid attributes" do
    end
  end

end
