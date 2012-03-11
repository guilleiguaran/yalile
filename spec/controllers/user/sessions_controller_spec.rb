require 'spec_helper'

describe User::SessionsController do
  it "should route GET /login to user/sessions#new" do
    {:get => "/login"}.should route_to(:controller => "user/sessions", :action => "new")
  end
  
  it "should route POST /login to user/sessions#create" do
    {:post => "/login"}.should route_to(:controller => "user/sessions", :action => "create")
  end
end
