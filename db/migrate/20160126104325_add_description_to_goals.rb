class AddDescriptionToGoals < ActiveRecord::Migration
  def change
		#specify the table name, attribute name, type of attribute
		add_column :goals, :description, :text
		#add timestamps
		add_column :goals, :created_at, :datetime
		add_column :goals, :updated_at, :datetime
  end
end
