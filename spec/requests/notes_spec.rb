require 'spec_helper'

describe "notes" do
  let!(:note) { FactoryGirl.create(:note) }
  let(:user) { FactoryGirl.create(:user) }

  it "can be reached via the header" do
    visit '/'
    click_link 'Dev Notes'
    page.current_url.should == notes_url
  end
  describe "index" do
    context "when user is logged in" do
      before { login_with(user) }
      it "displays a link to make a new blog" do
        visit notes_path
        page.should have_link("New Note", :href => new_note_path)
      end
    end
  end
end