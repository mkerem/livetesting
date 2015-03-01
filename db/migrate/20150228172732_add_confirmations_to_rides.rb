class AddConfirmationsToRides < ActiveRecord::Migration
  def change
  	add_column :rides, :pickup_confirmed, :boolean, default: false
  	add_column :rides, :pickup_confirmed_at, :datetime
  	add_column :rides, :dropoff_confirmed, :boolean, default: false
  	add_column :rides, :dropoff_confirmed_at, :datetime
  end
end
