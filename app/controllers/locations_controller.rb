class LocationsController < ApplicationController
	before_action :ensure_login, only: [:new, :create, :edit, :update]

	def index
		@locations = Location.all
	end

	def home
		#Welcome page
	end


	def show
	 	@location = Location.find_by(params[:id])
	 	@edibles = @location.edibles
	end

	def new
    	@location = Location.new
   
	end

	def create
		@location = Location.new(location_params)
		#@location.user = current_user
		@location.save
		redirect_to user_path(current_user)
	end

	def edit
		@location = Location.find_by(params[:id])
	end

	def update
		#@location = Location.find_by(params[:id]
		#@location.update(address: params[:address], lat: params[:lat], lng: params[:lng], description: params[:description], loc_type: params[:loc_type], location_edible: params[:location][:edible], user_id: current_user.id)
		#redirect_to location_path(@location)
	end

	def delete
	end


	private

	def location_params
		params.require(:location).permit(:address, :lat, :lng, :description) 
	end
end
