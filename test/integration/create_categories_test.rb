require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	def setup
			@user = User.create(username: "john", email: "john@example.com", password: "password", admin: true) #create admin user
	end
	
	
	test "get new category form and create category" do
		#similate user logging in
		sign_in_as(@user, "password")
		get new_category_path
		assert_template 'categories/new'
		#create a category and have it display somewhere
		assert_difference 'Category.count', 1 do
			post_via_redirect categories_path, category: {name: "sports"}
		end
		#After the category has been created, send user to index
		assert_template 'categories/index'
		#Ensure the word 'sports' exists in the page
		assert_match "sports", response.body
	end
	
	test "invalid category submission results in failure" do
		sign_in_as(@user, "password")
		get new_category_path
		assert_template 'categories/new'
		assert_no_difference 'Category.count'do
			post categories_path, category: {name: " "}
		end
		assert_template 'categories/new'
		assert_select 'h2.panel-title' #from _errors.html.erb file
		assert_select 'div.panel-body' #from _errors.html.erb file
	end
	
end

