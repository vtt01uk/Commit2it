require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
	#Run this key method called setup before the test
	def setup
		@category = Category.new(name: "sports")
	end
	
	test "category should be valid" do
		#Can we assert a new @category variable & is it valid?
		assert @category.valid?
	end
	
	test "name should be present" do
		@category.name = " "
		#If this is true, test has failed because expecting false return
		assert_not @category.valid?
	end

	test "name should be unique" do
		@category.save 
		category2 = Category.new(name: "sports")
		assert_not category2.valid?
	end
	
	test "name should not be too long" do
		@category.name = "a" * 25 #limit the length to 25 characters
		assert_not @category.valid?
	end
	
	test "name should not be too short" do
		@category.name = "aa" #name not shorter than 2 characters
		assert_not @category.valid?
	end

end
