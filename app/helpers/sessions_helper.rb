module SessionsHelper
	
	def current_user= (user)
		@current_user = user
	end

	def current_user
		@current_user ||= user_from_token
	end

	def logged_in?
		!current_user.nil?
	end

	private
		def user_from_token
			token = cookies[:user_token]
			User.find_by_token(token) unless token.nil?
		end
end
