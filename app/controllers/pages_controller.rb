class PagesController < ApplicationController

	#Define a method
	def home
		redirect_to goals_path if logged_in?
	end
	
	def about
	end

end
