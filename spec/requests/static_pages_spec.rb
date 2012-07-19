require 'spec_helper'

describe StaticPagesController do
	describe "Home Page" do
		it "should say welcome" do
			visit '/'
			page.should have_content("Welcome to my blog!")
		end
	end
end