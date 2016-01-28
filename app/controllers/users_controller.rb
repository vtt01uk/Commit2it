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
		
	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Your goal was edited"
			redirect_to goals_path
		else
			render 'edit'
		end
	end
	
	def show
		@user = User.find(params[:id])
	end
	
	
end

	private
	#Whitelist username, email & password
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end


