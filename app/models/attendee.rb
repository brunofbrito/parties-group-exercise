class Attendee < ActiveRecord::Base
	belongs_to :party
	validates :email, uniqueness: true
end
