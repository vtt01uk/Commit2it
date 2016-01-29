class SessionsController < ApplicationController

	def new
	end
	
	#handles form submissions
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		#user is found & based on password is true then...
		if user && user.authenticate(params[:session][:password])
			#browser cookies saves user_id and used for requests
			session[:user_id] = user.id
			flash[:success] = "You have successfully logged in"
			redirect_to user_path(user)
		else
			#flash message once
			flash.now[:danger] = "There was something wrong with your login information"
			render 'new'
		end
	end
	
	#stops user session
	def destroy
		session[:user_id] = nil
		flash[:success]= "You have logged out"
		redirect_to root_path
	end

end