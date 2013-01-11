require 'spec_helper'

describe "Blogs" do
  let(:blogpost) { FactoryGirl.create(:blog) }
  let(:user) { FactoryGirl.create(:user) }

  let(:post_title) { "Test Post 123" }
  let(:post_content) { "Testing testing 123..." }

  # Perhaps this 
  context "user is logged in" do
    before { login_with(user) }

    describe "new blog fields" do
      before { visit new_blog_path }
      subject { page }
      
      it "posts new blogs to the blog list" do
        fill_in "Title", with: post_title
        fill_in "Content", with: post_content
        click_button "Create Blog"
        visit blogs_path
        page.should have_content(post_title)
      end
    end
  end

  context "user is not logged in" do
    specify "redirects when new blog is attempted" do
      visit new_blog_path
      page.current_url.should == blogs_url
    end
  end
end
