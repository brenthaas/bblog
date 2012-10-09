require 'spec_helper'

describe BlogsController do 
  describe "successful path" do
    before do
      subject.stub!(:current_user).and_return(FactoryGirl.build(:user))
    end

    it "login redirect" do
      get :new
      response.should be_success
    end
  end

  describe "sad path" do
    before do
      subject.stub!(:current_user).and_return(nil)
    end

    it "login redirect" do
      get :new
      response.should redirect_to(blogs_path)
    end
  end
end