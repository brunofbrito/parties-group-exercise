class Party < ActiveRecord::Base
	has_many :attendees
	validates_presence_of :name, :address, :lat, :long, :starts_at
  def to_s
    name
  end
end
