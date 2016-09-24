class HomeController < ApplicationController
	def login
    @message = "Notice message here"
	end
	def logout
    @message = "You are successfully logged out!"
	end
end
