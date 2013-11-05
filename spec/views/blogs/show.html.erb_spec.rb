require 'spec_helper'

describe "blogs/show" do
  let!(:blog) { assign(:blog, FactoryGirl.create(:blog)) }

  describe "blog details" do
    before { render }
    it "shows the full blog title" do
      rendered.should have_content(blog.title)
    end
  end
end
