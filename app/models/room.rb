class Room < ActiveRecord::Base
	validate_presence_of :room_number, :size, :building
end
