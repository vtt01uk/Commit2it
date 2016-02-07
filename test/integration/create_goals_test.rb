require 'test_helper'

class CreateGoalsTest < ActionDispatch::IntegrationTest
	
	def setup
		@user = User.create(username: "test", email: "test@example.com", password: "password")
	end
	
	test "should create a new goal" do
		sign_in_as(@user, "password")
		get new_goal_path
		assert_template 'goals/new'
		assert_difference 'Goal.count', 1 do
			post goals_path, goal: {title: "This is an Integration test", description: "This is an integration test"}
		end
		assert_template 'goals/show'
		assert_match "integration test goal", response.body
		assert_select 'div.alert-success'
	end
	
	test "invalid goal submission" do
		sign_in_as(@user, "password")
		get new_goal_path
		assert_template 'goals/new'
		assert_no_difference 'Goal.count' do
			post goals_path, goal: {title: "x", description: "x"}
		end
		assert_template 'goals/new'
		assert_select 'div.panel-danger'
	end		
end