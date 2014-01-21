require 'spec_helper'

describe UsersController do
  integrate_views

  #Delete these examples and add some real ones
  it "should use UsersController" do
    controller.should be_an_instance_of(UsersController)
  end

  before(:each) do
    @base_title="Ruby on Rails Tutorial Sample App | "
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  
   it "should contain the string 'Sign up'" do
    get 'new'
    response.should have_tag("title", /Sign up/)
   end

   it "should have the correct title" do
    get 'new'
    response.should have_tag("title",
                               @base_title +"Sign up")
  end

 end
end
