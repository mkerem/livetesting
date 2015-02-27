class DispatchController < ApplicationController

def index
	@rides = Ride.all
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
	params.require(:ride).permit(:name, :pickup, :dropoff, :passenger_count, :comments)
end

end
