class HomeController < ApplicationController
	def login
        session.clear
    end
	def logout
        session.clear
    end
end
