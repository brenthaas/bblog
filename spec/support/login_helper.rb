module LoginHelper
	def login_with(user, pass)
		visit login_path
		fill_in "Username", with: user
		fill_in "Password", with: pass
		click_button "login"
	end
end

RSpec.configure do |config|
  config.include LoginHelper, :type => :request
end