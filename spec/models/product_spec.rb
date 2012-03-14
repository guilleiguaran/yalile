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
    before :all do
      create_list(:product, 2)
    end
    context "with invalid attrbutes" do
      it "should validates presence of name" do
        product = Product.first
        product.update_attributes(:name => "").should eq(false)
        product.should have(1).error_on(:name)
        product.reload.name.should eq("product 1")
      end
      it "should validates uniqueness of title" do
        product = Product.first
        product.update_attributes(:name => Product.last.name).should eq(false)
        product.should have(1).error_on(:name)
        product.reload.name.should eq("product 1")
      end
    end
    context "with valid attributes" do
      it "should update the product without errors" do
        product = Product.first
        product.update_attributes(:name => "adidas edited").should eq(true)
        product.should have(0).errors
        product.reload.name.should eq("adidas edited")
      end
    end
  end
end
