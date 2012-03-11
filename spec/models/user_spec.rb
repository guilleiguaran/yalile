require 'spec_helper'

describe User do

  context "Creating a user" do
    context "with valid attributes" do
      it "should return no errors" do
        user = build(:user, :email => "arturoblanco700@gmail.com", :user_name => "arturoblanco700", :full_name => "Arturo Blanco")
        user.save.should eq(true)
        user.should have(0).errors
        User.count.should eq(1)
        user = User.first
        user.full_name.should eq("Arturo Blanco")
        user.user_name.should eq("arturoblanco700")
        user.email.should eq("arturoblanco700@gmail.com")
      end
    end

    context "with invalid attributes" do
      it "should validates presence of email" do
        user = build(:user, :email => "")
        user.save.should eq(false)
        user.should have(1).error_on(:email)
        User.count.should eq(0)
      end

      it "should validates presence of full name" do
        user = build(:user, :full_name => "")
        user.save.should eq(false)
        user.should have(1).error_on(:full_name)
        User.count.should eq(0)
      end

      it "should validates presence of user name" do
        user = build(:user, :user_name => "")
        user.save.should eq(false)
        user.should have(1).error_on(:user_name)
        User.count.should eq(0)
      end

      it "should validates presence of password" do
        user = build(:user, :password => "")
        user.save.should eq(false)
        user.should have(1).error_on(:password)
        User.count.should eq(0)
      end

      it "should validates format of email" do
        user = build(:user, :email => "arturoblanco700@@gmail.com")
        user.save.should eq false
        user.should have(1).error_on(:email)
        User.count.should eq 0
      end
    end
  end

end
