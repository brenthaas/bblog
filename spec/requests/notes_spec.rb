require 'spec_helper'

describe "notes" do
  it "can be reached via the header" do
    visit '/'
    click_link 'Dev Notes'
    page.current_url.should == notes_url
  end
end