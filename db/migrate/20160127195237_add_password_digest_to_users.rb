class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
		#Table name, column name and type
		add_column :users, :password_digest, :string
	end
end
