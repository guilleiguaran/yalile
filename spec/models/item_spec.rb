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
