class LocationsController < ApplicationController
	before_action :authorize_user, only: [:edit, :update, :destroy]

	def home
		#Welcome page
	end

	def index
	    if params[:user_id]
	      @locations = User.find(params[:user_id]).locations
	      render 'users/show'
	    else
	      @locations = Location.all
	      render 'index'
	    end
	end

	def show
	 	@location = Location.find_by(params[:user_id])
	end

	def new
		if logged_in?
			@user = User.find_by(id: params[:user_id])
			@location = Location.new(user_id: params[:user_id])
		else
			redirect_to locations_path, alert: "You must be logged in to create a location."
		end
	end

	def create
		@location = current_user.locations.new(location_params)

		if @location.save
			redirect_to user_locations_path(current_user)
		else
			render :new
		end
	end

	def edit
    	if logged_in?
			@user = User.find_by(id: params[:user_id])
			@location = @user.locations.find_by(id: params[:id])
			redirect_to user_locations_path(current_user)
    	else
      		redirect_to locations_path, notice: "You can't edit someone else's location!"
 		end
	end

	def update
		@location = Location.find(params[:id])
		if @location.save
			@location.update(params.require(:location))
		#(address: params[:address], lat: params[:lat], lng: params[:lng], description: params[:description], loc_type: params[:loc_type], location_edible: params[:location][:edible], user_id: current_user.id)
			redirect_to location_path(@location)
		else
			render :edit
		end
	end

	def destroy
    	@location = Location.find(params[:id])
    	if logged_in?
    		@location.destroy
    		flash[:notice] = "Location deleted."
    		redirect_to user_locations_path
    	else
    		flash.now[:notice] = "You cannot delete another user's location."
    	end
  	end


	private

	def location_params
		params.require(:location).permit(:address, :desscription, :lat, :lng, :description, :user_id, :user_name, :loc_type, :edible_ids => []) 
	end
end
