require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
	#Ensure the routes are accessible
	
	def setup
		@category = Category.create(name: "sports")
		@user = User.create(username: "john", email: "john@example.com", password: "password", admin: true) #create admin user
	end
	
	test "should get categories index" do
		#Ensure you can access index
		get :index
		assert_response :success
	end
	
	test "should get new" do
		session[:user_id] = @user.id #Similate the admin has logged in
		get :new
		assert_response :success
	end
	
	
	test "should get show" do
		#generate the route for showing category
		get(:show, {'id'=>@category.id})
		assert_response :success
	end
	
	test "should redirect create when admin not logged in" do
		assert_no_difference 'Category.count' do
			post :create, category: { name: "sports" }
		end
		assert_redirected_to categories_path
	end
end