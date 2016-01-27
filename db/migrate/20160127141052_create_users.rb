class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
			#Create the fields in the User table
			t.string :username
			t.string :email
			t.timestamps
    end
  end
end
