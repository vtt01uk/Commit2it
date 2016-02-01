class Category < ActiveRecord::Base
	has_many :goal_categories
	has_many :goals, through: :goal_categories
	
	validates :name, presence: true, length: { minimum: 3, maximum: 10 }
	validates_uniqueness_of :name
	
end