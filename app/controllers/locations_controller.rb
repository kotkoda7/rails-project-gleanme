class LocationsController < ApplicationController

	def home
		@locations = Location.all
	end

	def new
		@location = Location.new
	end
end
