class AddUserIdToGoals < ActiveRecord::Migration
  def change
		#add the table, column name and type
		add_column :goals, :user_id, :integer
  end
end
