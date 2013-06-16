class SessionsController < ApplicationController
	
	def new
	end

	def create
		user = User.find_by_email(params[:session][:email])

		if user.authenticate(params[:session][:password])
			flash[:success]='Logged succeed'
			redirect_to root_path
		else
			flash[:alert]='Username or password is not correct'
			render 'new'	
		end 
	end
end
