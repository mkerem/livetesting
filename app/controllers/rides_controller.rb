class RidesController < ApplicationController

def index
redirect_to 'dispatch#index'
end

def new
end

def destroy
	@rides = Rides.find(params[:id])
	@rides.destroy
	redirect_to @dispatch
end

def create
@rides = Rides.new(rides_params)
@rides.save
redirect_to @rides

#render plain: params[:rides].inspect
#@post=Post.new(params[:post].permit(:title,:text))
#@post.save
#redirect_to @post
end

public
def rides_params
	params.require(:rides).permit(:name, :Present, :Dropoff, :Passengers)
end

def show
@rides = Rides.find(params[:id])
end

def edit
@rides = Rides.find(params[:id])
redirect_to @dispatch
end

def update
	@rides = Rides.find(params[:id])
	if @rides.update(rides_params)
	redirect_to @rides
	else
	render 'edit'
	end
end

public
	def rides_params
	params.require(:rides).permit(:name, :Present, :Dropoff, :Passengers)
end

#private
#def post_params
#params.require(:post).permit(:title, :text)
#end

#public
#def show
#@post=Post.find(params[:id])
#end

end
