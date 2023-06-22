class AddPassengerCountToPassengers < ActiveRecord::Migration[7.0]
  def change
    add_column :passengers, :passenger_count, :integer
  end
end
