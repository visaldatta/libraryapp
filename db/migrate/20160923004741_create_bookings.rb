class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :room_number
      t.integer :user_id
      t.datetime :datetime

      t.timestamps null: false
    end
  end
end
