class HomeController < ApplicationController
	def login
    end
	def logout
        session.clear
    end
end
