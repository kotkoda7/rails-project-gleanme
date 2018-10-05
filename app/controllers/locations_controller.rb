class LocationsController < ApplicationController

	def index
		@locations = Location.all
	end


	def show
	 	@location = Location.find_by(params[:id])
	 	#@edibles = @location.edibles
	end

	def new
		@location = Location.new
		#@edible = Edible.new
		#@edibles = Edible.all
		#@locations = Location.all
		#@location.edibles.build
	end

	def create
		@location = Location.new(location_params)
		@location.user = current_user
		@location.save
		#redirect_to location_path(@location)
	end

	def edit
		#@location = Location.find_by(params[:id])
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
		params.require(:location).permit!
	end
end
