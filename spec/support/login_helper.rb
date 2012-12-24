module LoginHelper
  def login_with(user, pass='password')
    visit login_path
    fill_in "Username", with: user
    fill_in "Password", with: pass
    click_button "login"
  end

  def logged_in
    subject.stub!(:current_user).and_return(FactoryGirl.build(:user))
  end
end
