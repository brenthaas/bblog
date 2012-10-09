require 'spec_helper'

describe "blogs/index" do
  before(:each) do
    @blogs = [ FactoryGirl.create(:blog, title: "TestBlog 1"),
    					FactoryGirl.create(:blog, title: "TestBlog 2") ]
  end

  it "renders a list of blogs" do
    render 

    rendered.should have_selector('h3', class: "post_title", count: @blogs.count)
  end
end
