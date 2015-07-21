class CreatePartiesTable < ActiveRecord::Migration
  def change
  	create_table :parties do |table|
  		table.string :name, null: false
  		table.string :address, null: false
  		table.string :coordinates, null: false
  		table.date :date, null: false
  		table.time :time, null: false
  		table.timestamps
		end
  end
end
