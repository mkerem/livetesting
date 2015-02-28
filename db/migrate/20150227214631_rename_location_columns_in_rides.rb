class RenameLocationColumnsInRides < ActiveRecord::Migration
  def change
    rename_column :rides, :pickup, :pickup_location_id
    rename_column :rides, :dropoff, :dropoff_location_id
  end
end
