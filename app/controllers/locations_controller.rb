class LocationsController < ApplicationController

	def home
		@locations = Location.all
	end

	def new
		@location = Location.new
		@edibles = Edible.all
		#@edible.location_edible.build
		
	end

	private

	def location_params

		params.require(:location).permit!
		#(:address, :lat, :lng, :description, :loc_type)
	end
end
