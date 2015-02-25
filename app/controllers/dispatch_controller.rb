class DispatchController < ApplicationController

def index
	@rides = Rides.all
end

def edit
	@rides = Rides.find(params[:id])
end

def destroy
	@rides = Rides.find(params[:id])
	@rides.destroy
	redirect_to rides_path
end

def update
	@rides = Rides.find(params[:id])
	
	if @rides.update(rides_params)
	redirect_to @dispatch
	else
	render 'edit'
	end
end

public #should be private?
def rides_params
	params.require(:rides).permit(:name, :Present, :Dropoff, :Passengers)

end

end
