class CreateAttendeesTable < ActiveRecord::Migration
  def change 
  	create_table :attendees do |table|
  		table.string :name, null: false
  		table.string :email, null: false
  	end
  end
end
