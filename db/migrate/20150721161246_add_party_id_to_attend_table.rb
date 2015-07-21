class AddPartyIdToAttendTable < ActiveRecord::Migration
  def change
  	add_column :attendee, :party_id, :integer
  end
end
