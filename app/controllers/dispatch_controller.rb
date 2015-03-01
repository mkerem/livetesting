class DispatchController < ApplicationController

def index
	@incoming_rides = Ride.not_completed
	@completed_rides = Ride.completed
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
