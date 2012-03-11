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
end
