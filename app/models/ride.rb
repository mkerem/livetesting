class Ride < ActiveRecord::Base
	belongs_to :pickup, class_name: 'Location', foreign_key: 'pickup_location_id'
	belongs_to :dropoff, class_name: 'Location', foreign_key: 'dropoff_location_id'

	scope :completed, -> { where(pickup_confirmed: true, dropoff_confirmed: true) }
	scope :not_completed, -> { where('"pickup_confirmed" = ? OR "dropoff_confirmed" = ?', false, false) }
	scope :for_date, -> (date) { where("created_at >= ? AND created_at <= ?", date, date + 5.hours)}

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

	def confirmed?
		pickup_confirmed && dropoff_confirmed
	end

	def waiting_time
		if Ride.for_date(Date.current).count < 3
			"under 30 minutes"
		else
			"between 30 minutes to 1 hour"
		end
	end
end
