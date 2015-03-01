class Location < ActiveRecord::Base
  has_many :pickup_rides, class_name: 'Ride', foreign_key: 'pickup_location_id'
  has_many :dropoff_rides, class_name: 'Ride', foreign_key: 'dropoff_location_id'
end
