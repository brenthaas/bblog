require 'spec_helper'

describe BlogsController do 
  let!(:blog) { FactoryGirl.create(:blog) }
  
  context "user logged in" do
    before { logged_in }

    it "allows get of new page" do
      get :new
      response.should be_success
    end

    it "allows get of edit" do
      get :edit, :id => blog.id
      response.should be_success
    end
  end

  context "no user logged in" do
    it "redirects to the blog list when getting new" do
      get :new
      response.should redirect_to(blogs_path)
    end
    it "redirects to blog list when getting edit" do
      get :edit, :id => blog.id
      response.should redirect_to(blogs_path)
    end
  end
end
