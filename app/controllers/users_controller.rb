class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		#Whitelist what we are accepting
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome #{@user.username} on taking the first step!"
			redirect_to goals_path
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
		
end

