require 'spec_helper'

describe "blogs/show" do
  before(:each) do
    @blog = assign(:blog, stub_model(Blog))
  end

  it "renders attributes in <p>" do
    render
  end
end
