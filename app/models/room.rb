class Room < ActiveRecord::Base
	has_and_belongs_to_many :bookings
	validates_presence_of :room_number, :size, :building

end
