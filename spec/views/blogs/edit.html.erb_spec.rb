require 'spec_helper'

describe "blogs/edit" do
  before(:each) do
    @blog = assign(:blog, stub_model(Blog))
  end

  it "renders the edit blog form" do
    render

    rendered.should have_selector("form", :action => blog_path(@blog), :method => "post") do |form|
    end
  end
end
