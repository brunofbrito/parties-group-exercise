class RemoveAttendeeIdFromPartyTable < ActiveRecord::Migration
  def change
  	remove_column :party, :attendee_id, :integer
  end
end
