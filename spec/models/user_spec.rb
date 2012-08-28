# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string(255)      default(""), not null
#  encrypted_password  :string(255)      default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0)
#  status              :integer          default(0), not null
#  fullname            :string(255)      not null
#  username            :string(255)      not null
#  is_admin            :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_users_on_fullname_and_username_and_email  (fullname,username,email) UNIQUE
#

require 'spec_helper'

describe User do

  context "Creating a user" do
    context "with valid attributes" do
      it "should return no errors" do
        user = build(:user, :email => "arturoblanco700@gmail.com", :username => "arturoblanco700", :fullname => "Arturo Blanco")
        user.save.should eq(true)
        user.should have(0).errors
        User.count.should eq(1)
        user = User.first
        user.fullname.should eq("Arturo Blanco")
        user.username.should eq("arturoblanco700")
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
        user = build(:user, :fullname => "")
        user.save.should eq(false)
        user.should have(1).error_on(:fullname)
        User.count.should eq(0)
      end

      it "should validates presence of user name" do
        user = build(:user, :username => "")
        user.save.should eq(false)
        user.should have(1).error_on(:username)
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

  context "Validating a user" do
    before :all do
      create(:user, :username => "arturoblanco", :password => "123456")
    end
    it "should return the user if the email and password match" do
      user = User.find_user(:username => "arturoblanco", :password => "123456")
      user.should_not be_blank
    end
    it "should return nil if the user is valid but the password do not match" do
      user = User.find_user(:username => "arturoblanco", :password => "123")
      user.should be_nil
    end
    it "should return nil if teh user was not found" do
      user = User.find_user(:username => "usernotfounded", :password => "123")
      user.should be_nil
    end
  end

end
