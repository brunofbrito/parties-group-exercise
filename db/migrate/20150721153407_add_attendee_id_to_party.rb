class AddAttendeeIdToParty < ActiveRecord::Migration
  def change
  	add_column :parties, :attendee_id, :integer
  end
end
