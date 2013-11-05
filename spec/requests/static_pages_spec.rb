require 'spec_helper'

describe StaticPagesController do
  describe "login page" do
    before { visit login_path }

    specify { page.should have_field("Username") }
    specify { page.should have_field("Password") }
  end
end
