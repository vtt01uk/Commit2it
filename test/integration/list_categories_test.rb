require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

	def setup
		@category = Category.create(name: "books")
		@category2 = Category.create(name: "program")
	end
	
	test "should show categories listing" do
		get categories_path #rake routes
		assert_template 'categories/index'
		#test all links to category_path
		assert_select "a[href=?]", category_path(@category), text: @category.name
		assert_select "a[href=?]", category_path(@category2), text: @category2.name
	end
	
end


