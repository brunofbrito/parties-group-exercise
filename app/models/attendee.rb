class Attendee < ActiveRecord::Base
	belongs_to :party
	validates_uniqueness_of :email, scope: :party_id
end
