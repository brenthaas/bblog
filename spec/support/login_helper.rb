module LoginHelper
	def login_with(user, pass)
		visit login_path
		fill_in "Username", with: user
		fill_in "Password", with: pass
		click_button "login"
	end

	def authorized(worked=true)
		# trying to get stubbing working - no stubbing module/mix-in methods?
		@helpme = Object.new.extend SessionsHelper
		@helpme.stub!(:logged_in?).and_return(worked)
		@helpme.stub(:authorize_or_redirect!).and_return(worked)
	end 
end

RSpec.configure do |config|
  config.include LoginHelper, :type => :request
end