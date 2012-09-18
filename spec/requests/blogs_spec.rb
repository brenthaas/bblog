require 'spec_helper'

describe "Blogs" do
	let(:post) { FactoryGirl.create(:blog) }

  context "user is logged in" do
    before { authorized }

  	describe "new blog fields" do
      before { visit new_blog_path }
  		subject { page }
      
#      it "brings you to the new blog page" do
#        @helpme.stub!(:logged_in?).and_return(true)
#        page.current_url.should == new_blog_url
#      end

 # 		it "allows for new blog info to be entered" do
 # 			fill_in "Title", with: "Welcome to my test blog!"
 # 			fill_in "Content", with: "Blah blah blah blah blah"
 # 			click_button "submit"
 # 		end
  	end
  end

  context "user is not logged in" do
  	before { authorized(false) }

  	specify "redirects when new blog is attempted" do
  		visit new_blog_path
  		page.current_url.should == blogs_url
  	end
  end
end
