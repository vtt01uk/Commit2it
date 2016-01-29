class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	#New login methods; available to controllers but not views by default
	helper_method :current_user, :logged_in?
	
	def current_user
		#return current useruser else if not, then return this user object if user_id session in db exists
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	
	def logged_in?
		#convert to boolean
		!!current_user
	end
	
	def require_user
		if !logged_in?
			flash[:danger] = "You must be logged in to perform that action"
			redirect_to root_path
		end
	end
	
end
