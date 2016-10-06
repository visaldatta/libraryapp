class HomeController < ApplicationController
	def login
		#  if(session[:user]!= nil)
	   # respond_to do |format|
	    #      format.html { redirect_to controller: 'bookings'}    
	     # end
	  #else
	        #  session.clear
  		#end
    end
	def logout
        session.clear
        @tempUser = User.new
        session[:user] = @tempUser
        render "login"
    end
end
