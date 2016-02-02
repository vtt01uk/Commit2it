class GoalsController < ApplicationController
	#Ensure the set_goal method is called before the other methods are actioned
	before_action :set_goal, only: [:edit, :update, :show, :destroy]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def index
		#Display 5 items per page using pagination
		@goals = Goal.paginate(page: params[:page], per_page: 5)
	end
	
	def new
		@goal = Goal.new
	end
	
	def edit
		#find the goal based on its id
	end
	
	def create
		#Using gemfile called 'byebug'
#debugger 
		#Display what has been passed in into the controller
		#
#		render plain: params[:goal].inspect
		#Create an instance variable with method
		@goal = Goal.new(goal_params)
		#the creator of the goal will be associated as the current user
		@goal.user = current_user
		if @goal.save
			#do something
			flash[:success] = "You have created a new goal!"
			redirect_to goal_path(@goal)
		else
			#do something else
			render 'new'
		end
	end

	def update
		#Perform validations
		if @goal.update(goal_params)
			flash[:success] = "Goal was successfully updated"
			#redirect to goal show page
			redirect_to goal_path(@goal)
		else
			render 'edit'
		end
	end
		
	def show
	end

	def destroy

		@goal.destroy
		flash[:danger] = "Goal was deleted"
		redirect_to goals_path
	end
	
	private
	
	def set_goal
		@goal = Goal.find(params[:id])
	end
	
	#define the method
	def goal_params
		params.require(:goal).permit(:title, :description, category_ids:[])
	end
	
	def require_same_user
		if current_user != @goal.user and !current_user.admin?
			flash[:danger] = "You can only edit or delete your own goal"
			redirect_to root_path
		end
	end
	
end

