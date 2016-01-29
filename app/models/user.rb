class User < ActiveRecord::Base
	#Defining 1:many association
	#Whatever goals the user has, it will destroy them if they are deleted
	has_many :goals, dependent: :destroy
	#before the user accesses the database, it will save the email address in lowercase before saving it in the db
	before_save { self.email = email.downcase }
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
	#Method for password authentication
	has_secure_password
end