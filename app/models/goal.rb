class Goal < ActiveRecord::Base
	belongs_to :user
	has_many :goal_categories
	has_many :categories, through: :goal_categories
	
	
	#Add validation when creating goals
	validates :title, presence: true, length: { minimum: 3, maximum: 50 }
	validates :description, presence: true, length: { minimum: 10, maximum: 300 }
	validates :user_id, presence: true
end
