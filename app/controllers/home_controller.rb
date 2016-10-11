class HomeController < ApplicationController
	def login
	end

	def logout
		session.clear
		@tempUser = User.new
		session[:user] = @tempUser
		render "login"
	end
end
