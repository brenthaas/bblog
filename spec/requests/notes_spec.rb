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
      before do
        login_with(user)
        visit notes_path
      end 
      it "displays a link to make a new blog" do
        page.should have_link("New Note", :href => new_note_path)
      end
    end
  end
  describe "show" do
    before { visit note_path(note) }
    it "displays the note title" do
      page.should have_content(note.title)
    end
    it "displays the note content" do
      page.should have_content(note.content)
    end
  end
end
