require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "login" do
    before { visit login_path }

    it { should have_selector("h2", text: "login")}
    it { should have_field("Username") }
    it { should have_field("Password") }
    it { should have_button("login")}

    context "with bad credentials" do
      before do 
        login_with(stub_model(User))
      end

      it "displays an error for invalid credentials" do
        page.should have_selector('div.alert', text: 'Invalid')
      end

      it "sends you back to the login page" do
        page.current_path.should == login_path
      end
    end

    context "successful login" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        login_with(user)
      end

      specify "you are sent to the users home page" do
        page.current_path.should == user_path(user)
      end

      it "displays a logout link" do
        should have_link("Log Out")
      end
    end
  end
end
