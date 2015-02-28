class Ride < ActiveRecord::Base
	belongs_to :pickup, class_name: 'Location', foreign_key: 'pickup_location_id'
	belongs_to :dropoff, class_name: 'Location', foreign_key: 'dropoff_location_id'

	scope :completed, -> { where(pickup_confirmed: true, dropoff_confirmed: true) }
	scope :not_completed, -> { where('"pickup_confirmed" = ? OR "dropoff_confirmed" = ?', false, false) }

	def confirm_pickup!
		self.pickup_confirmed = true
		self.pickup_confirmed_at = DateTime.current
		self.save
	end

	def confirm_dropoff!
		self.dropoff_confirmed = true
		self.dropoff_confirmed_at = DateTime.current
		self.save
	end
end
