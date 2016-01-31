require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	test "get new category form and create category" do
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
end

