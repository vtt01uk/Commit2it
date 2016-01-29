class AddAdminToUsers < ActiveRecord::Migration
  def change
		#table name, column name & type set to false for every user
		add_column :users, :admin, :boolean, default: false
  end
end
