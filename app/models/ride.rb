class Ride < ActiveRecord::Base
	belongs_to :pickup, class_name: 'Location', foreign_key: 'pickup'
	belongs_to :dropoff, class_name: 'Location', foreign_key: 'dropoff'
end
