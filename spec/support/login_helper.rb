module LoginHelper
  def login_with(user)
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "login"
  end

  def logged_in
    subject.stub!(:current_user).and_return(FactoryGirl.build(:user))
  end
end
