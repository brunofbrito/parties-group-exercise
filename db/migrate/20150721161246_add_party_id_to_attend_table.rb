class AddPartyIdToAttendTable < ActiveRecord::Migration
  def change
  	add_column :attendees, :party_id, :integer
  end
end
