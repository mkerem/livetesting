class Ride < ActiveRecord::Base
	belongs_to :pickup, class_name: 'Location', foreign_key: 'pickup_location_id'
	belongs_to :dropoff, class_name: 'Location', foreign_key: 'dropoff_location_id'
end
