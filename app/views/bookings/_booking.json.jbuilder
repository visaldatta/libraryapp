json.extract! booking, :id, :room_number, :user_id, :datetime, :created_at, :updated_at
json.url booking_url(booking, format: :json)