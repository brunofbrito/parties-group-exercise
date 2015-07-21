class CreatePartiesTable < ActiveRecord::Migration
  def change
  	create_table :parties do |table|
  		table.string :name, null: false
  		table.string :address, null: false
  		table.string :lat, null: false
  		table.string :long, null: false
  		table.datetime :starts_at, null: false
  		table.timestamps
		end
  end
end
