class LocationsController < ApplicationController

	def home
		@locations = Location.all
	end

	def show
	 	@location = Location.find(params[:id])
	end

	def new
		@location = Location.new
		@edibles = Edible.all
		@locations = Location.all.uniq
		@edible = Edible.new
		#@location_edible = @location.location_edibles.build
	end


	def create
		@location = current_user.locations.new(location_params)
		@location.save
		redirect_to location_path(@location)
	end

	def edit
		@location = find_by(params[:id]
	end

	def update
		@location = find_by(params[:id]
		@location.update(address: params[:address], lat: params[:lat], lng: params[:lng], description: params[:description], loc_type: params[:loc_type], location_edible: params[:location][:edible], user_id: current_user.id)
		redirect_to location_path(@location)
	end

	def delete
	end



	private

	def location_params

		params.require(:location).permit(:address, :loc_type)
	end
end
