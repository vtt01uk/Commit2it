class GoalsController < ApplicationController
	
	def index
		#grab all the goals
		@goals = Goal.all
	end
	
	def new
		@goal = Goal.new
	end
	
	def edit
		#find the goal based on its id
		@goal = Goal.find(params[:id])
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

	def update
		@goal = Goal.find(params[:id])
		if @goal.update(goal_params)
			flash[:notice] = "You have edited your goal"
			#redirect to goal show page
			redirect_to goal_path(@goal)
		else
			render 'edit'
		end
	end
		
	def show
		#find the goal based on its id
		@goal = Goal.find(params[:id])
	end

	def destroy
		@goal = Goal.find(params[:id])
		@goal.destroy
		flash[:notice] = "Goal was deleted"
		redirect_to goals_path
	end
	
	private
	#define the method
	def goal_params
		params.require(:goal).permit(:title, :description)
	end
end

