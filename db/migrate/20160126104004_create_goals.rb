class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
			#create columns
			t.string :title
    end
  end
end
