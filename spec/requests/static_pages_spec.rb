require 'spec_helper'

describe StaticPagesController do
	describe "Home Page" do
		before { visit '/' }

		it "should say welcome" do
			page.should have_content("Welcome to my blog!")
		end
	end

	describe "login page" do
		before { visit login_path }

		specify { page.should have_field("Username") }
		specify { page.should have_field("Password") }
	end
end