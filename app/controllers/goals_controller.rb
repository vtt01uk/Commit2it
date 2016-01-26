class GoalsController < ApplicationController
	def new
		@goal = Goal.new
	end

	def create
		#Display what has been passed in into the controller
		#
#		render plain: params[:goal].inspect
		#Create an instance variable with method
		@goal = Goal.new(goal_params)
		if @goal.save
			#do something
			flash[:notice] = "You have created a new goal!"
			redirect_to goal_path(@goal)
		else
			#do something else
			render 'new'
		end
	end
	
	def show
		#find the goal based on its id
		@goal = Goal.find(params[:id])
	end

	private
	#define the method
	def goal_params
		params.require(:goal).permit(:title, :description)
	end

end

