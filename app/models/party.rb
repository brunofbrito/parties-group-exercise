class Party < ActiveRecord::Base
	has_many :attendees
	validates_presence_of :name, :address, :lat, :long, :starts_at
  def to_s
    name
  end

  def import_csv(import)
      CSV.foreach(import, headers: true) do |row|
        attendees.create(row.to_hash)
      end
  end

end
