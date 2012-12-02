require 'spec_helper'

describe "blogs/index" do
	before { @blogs = FactoryGirl.create_list(:blog, 5) }

  it "renders a list of blogs" do
    render 
    assert_select "div.blog_post", count: @blogs.count
  end
end
