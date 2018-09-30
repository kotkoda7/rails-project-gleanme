class LocationsController < ApplicationController

	def home
		@locations = Location.all
	end

	def new
		@location = Location.new
		@edibles = Edible.all
		@locations = Location.all.uniq
		@edible = Edible.new
		#@location_edible = @location.location_edibles.build
	end

	def create
		location = Location.create(location_params)
		#@locations = Location.all
		#redirect_to location
	end

	private

	def location_params

		params.require(:location).permit(:address, :loc_type)
	end
end
