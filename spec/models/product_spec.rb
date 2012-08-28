# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_products_on_name  (name) UNIQUE
#

require 'spec_helper'

describe Product do

  context "on create" do
    context "with invalid attributes" do
      it "should validates presence of name" do
        product = build(:product, :name => "")
        product.save.should eq(false)
        product.should have(1).error_on(:name)
        Product.count.should eq(0)
      end
      it "should validates uniqueness of name" do
        eprod = create(:product, :name => "adidas")
        product = build(:product, :name => eprod.name)
        product.save.should eq(false)
        product.should have(1).error_on(:name)
        Product.count.should eq(1)
      end
    end
    context "with valid attributes" do
      it "should save the record" do
        product = build(:product, :name => "adidas")
        product.save.should eq(true)
        Product.count.should eq(1)
        Product.first.name.should eq("adidas")
      end
    end
  end

  context "on update" do
    context "with invalid attrbutes" do
      before :each do
        create_list(:product, 2)
      end
      it "should validates presence of name" do
        product = Product.first
        product_name = product.name
        product.update_attributes(:name => "").should eq(false)
        product.should have(1).error_on(:name)
        product.reload.name.should eq(product_name)
      end
      it "should validates uniqueness of title" do
        product = Product.first
        product_name = product.name
        product.update_attributes(:name => Product.last.name).should eq(false)
        product.should have(1).error_on(:name)
        product.reload.name.should eq(product_name)
      end
    end
    context "with valid attributes" do
      before :each do
        create_list(:product, 2)
      end
      it "should update the product without errors" do
        product = Product.first
        product.update_attributes(:name => "adidas edited").should eq(true)
        product.should have(0).errors
        product.reload.name.should eq("adidas edited")
      end
    end
  end

  context "on destroy" do
    before :each do
      create_list(:product, 2)
    end
    it "should not delete the product" do
      product = Product.first
      product.destroy.should eq(false)
      Product.count.should eq(2)
    end
  end
end
