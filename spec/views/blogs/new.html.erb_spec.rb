require 'spec_helper'

describe "blogs/new" do
  before(:each) do
    assign(:blog, stub_model(Blog).as_new_record)
  end

  it "renders new blog form" do
    render

    rendered.should have_selector("form", :action => blogs_path, :method => "post") do |form|
    end
  end
end
