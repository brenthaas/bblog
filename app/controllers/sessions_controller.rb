class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.find_by_username(params[:user][:username])
		if user && user.authenticate(params[:user][:password])
			redirect_to user
		else
			flash[:error] = "Invalid credentials"
			redirect_to login_path
		end
	end

	def destroy
	end
end