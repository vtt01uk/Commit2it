require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
	#Ensure the routes are accessible
	
	def setup
		@category = Category.create(name: "sports")
	end
	
	test "should get categories index" do
		#Ensure you can access index
		get :index
		assert_response :success
	end
	
	test "should get new" do
		get :new
		assert_response :success
	end
	
	
	test "should get show" do
		#generate the route for showing category
		get(:show, {'id'=>@category.id})
		assert_response :success
	end
end