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
		@goal.save
		redirect_to goals_show(@goal)
	end
	
	private
	#define the method
	def goal_params
		params.require(:goal).permit(:title, :description)
	end

end

