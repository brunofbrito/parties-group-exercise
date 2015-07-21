class RemoveAttendeeIdFromPartyTable < ActiveRecord::Migration
  def change
  	remove_column :parties, :attendee_id, :integer
  end
end
