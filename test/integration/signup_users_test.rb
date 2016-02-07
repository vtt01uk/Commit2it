require 'test_helper'

class SignUpUsersTest < ActionDispatch::IntegrationTest

	def setup
		@user = User.create(username: "test", email: "test@example.com", password: "password")
	end
	
	test "should sign up a user" do
		get signup_path
		assert_template 'users/new'
		assert_difference 'User.count', 1 do
			post users_path, user: {username: "test", email: "test@examples.com", password: "password", admin:true}
	end
		assert_template 'users/show'
		assert_match "test", response.body
		assert_select 'div.alert-success'
	end
	
end