require 'spec_helper'

describe NotesController do
  let!(:note) { FactoryGirl.create(:note) }
  context "when user is logged in" do
    before { logged_in }
    it "allows get of new page" do
      get :new
      response.should be_successful
    end
    it "creates a new note in db when create" do
      expect {
        post :create, {:note => {title: "title", content: "stuff"}}
        }.to change(Note, :count).by 1
    end
  end
  context "when no user is logged in" do
    it "redirects when getting new" do
      get :new
      response.should redirect_to blogs_path
    end
  end
end
