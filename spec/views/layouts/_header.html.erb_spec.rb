require 'spec_helper'

describe "layouts/_header" do
	context "without authentication" do
		before { render :partial => "layouts/header" }
		it "has a link to blogs" do
			rendered.should have_link("Blog", :href => blogs_path)
		end
		it "has a link to notes" do
			rendered.should have_link("Dev Notes", :href => notes_path)
		end
		it "has a link to About Me" do
			rendered.should have_link("About me", :href => about_path)
		end
	end
	context "when authenticated" do
		before do 
			view.stub!(:logged_in?).and_return(true)
			render :partial => "layouts/header" 
		end 
		it "has a link to log out" do
			rendered.should have_link("Log Out")
		end
	end
end