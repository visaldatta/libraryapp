class Room < ActiveRecord::Base
	validates_presence_of :room_number, :size, :building
end
