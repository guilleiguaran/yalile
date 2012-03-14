require 'spec_helper'

describe User::SessionsController do
  it "should route GET /login to user/sessions#new" do
    {:get => "/login"}.should route_to(:controller => "user/sessions", :action => "new")
  end

  it "should route POST /login to user/sessions#create" do
    {:post => "/login"}.should route_to(:controller => "user/sessions", :action => "create")
  end

  context "on GET to #new" do
    before(:each) do
      request.env["devise.mapping"] = Devise.mappings[:user]
    end
    context "as an authenticated user" do
      context "with role admin" do
      end
      context "as a normal user" do
      end
    end
    context "as a non authenticated user" do
      it "should respond with success" do
        get :new
        response.should be_success
      end
    end
  end

  context "on POST to #create" do
    context "with a non registered user" do
      before(:each) do
        request.env["devise.mapping"] = Devise.mappings[:user]
      end
      it "should login the user if the email and password are corrects" do
        create(:user, :username => "arturoblanco", :password => "123456")
        post :create, :user => {:username => "arturoblanco", :password => "123456"}
        user = subject.current_user
        user.should_not be_nil
        user.username.should eq("arturoblanco")
      end
      it "should redirect to new sale if the current user is not an admin" do
      end
      it "should redirect to the admin site if the current user is an admin" do
      end
    end
  end
end
