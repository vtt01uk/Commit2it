class User < ActiveRecord::Base
	#Validate username
	validates :username, presence: true,
						uniqueness: { case_sensitive: false }, 
						length: { minimum: 3, maximum: 25 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
						length: { maximum: 50 },
						uniqueness: { case_sensitive: false },
	#Check email format
						format: { with: VALID_EMAIL_REGEX }
end