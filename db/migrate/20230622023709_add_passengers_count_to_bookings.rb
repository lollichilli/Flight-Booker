class AddPassengersCountToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :passengers_count, :integer
  end
end
