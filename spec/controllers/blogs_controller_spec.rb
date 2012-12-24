require 'spec_helper'

describe BlogsController do 
  context "user logged in" do
    before { logged_in }

    it "gets the new page" do
      get :new
      response.should be_success
    end
  end

  context "no user logged in" do
    it "redirects to the blog list" do
      get :new
      response.should redirect_to(blogs_path)
    end
  end
end