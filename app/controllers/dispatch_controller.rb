class DispatchController < ApplicationController

def index
	if params[:date].present? # 2015-03-01
		date_values = params[:date].split('-') # 2015, 03, 01
		date = DateTime.new(date_values[0].to_i, date_values[1].to_i, date_values[2].to_i, 23, 00, 00)
		@incoming_rides = Ride.not_completed.for_date(date) # 2015-03-01-23:00
		@completed_rides = Ride.completed.for_date(date)
	else
		@incoming_rides = Ride.not_completed
		@completed_rides = Ride.completed
	end
	@ride = Ride.new
end

def edit
	@ride = Ride.find(params[:id])
end

def destroy
	@ride = Ride.find(params[:id])
	@ride.destroy
	redirect_to @dispatch
end

def update
	@ride = Ride.find(params[:id])

	if @ride.update(rides_params)
	redirect_to @dispatch
	else
	render 'edit'
	end
end

private
def rides_params
	params.require(:ride).permit(:name, :pickup_location_id, :dropoff_location_id, :passenger_count, :comments)
end

end
