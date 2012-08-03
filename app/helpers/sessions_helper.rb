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

	def authorize_or_redirect!
		redirect_to blogs_path, error: "Not Authorized!" unless logged_in?
	end

	private
		def user_from_token
			token = cookies[:user_token]
			User.find_by_token(token) unless token.nil?
		end
end
