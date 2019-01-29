class LocationsController < ApplicationController
	before_action :current_user, except: [:home, :show, :index]
	#before_action :own_location, only: [:edit, :update]

	def home
		#Welcome page
	end

	def index
	    @locations = Location.all
	end

	def show
	 	@location = Location.find_by_id(params[:id])
	 	#@location = Location.find_by(params[:id])
	 	@edibles = @location.location_edibles #nested??
	end

	def new
		#add a new location (aka user's location), must be logged in to do that!
		if current_user
			@user = User.find_by(id: params[:user_id])
			@location = Location.new(id: params[:user_id])
			@locations = Location.all
			@edible = Edible.new
			@edibles = 6.times.collect { @location.location_edibles.build }
		else
			redirect_to locations_path, alert: "You must be logged in to create a location."
		end
	end

 	def create
		@location = Location.new(location_params)
		@location.user = current_user
		@location.save
		redirect_to user_path(current_user)
	end


	def edit
		#edit of location (by same user only)
		#raise params.inspect
    	if current_user
			@user = User.find_by(id: params[:user_id])
			@location = Location.find_by(id: params[:id])
			#@location = Location.find_by(id: params[:id])
			@edibles = Edible.all
			
			render 'edit'
			#redirect_to edit_user_location_path(current_user)
    	else
      		redirect_to locations_path, notice: "You can't edit someone else's location!"
 		end

	end


	def update

		@user = User.find_by(id: params[:user_id])
		@location = @user.locations.find_by(id: params[:id])
		@edible = Edible.find_by(id: params[:id])

		unless current_user == @location.user
   		redirect_to(@location, notice: "You cannot edit other people's entry")
		
		if @location.save
			@location.update(location_params)
			@location.location_edibles.update(location_params)
		#(address: params[:address], lat: params[:lat], lng: params[:lng], description: params[:description], loc_type: params[:loc_type], location_edible: params[:location][:edible], user_id: current_user.id)
			redirect_to location_path(@location)
		else
			render :edit
		end
	end

	

	end

=begin
	def update
		@user = User.find_by(id: params[:user_id])
		@location = @user.locations.find_by(id: params[:id])
		@edible = Edible.find_by(id: params[:id])
		
		if @location.save
			@location.update(location_params)
			@location.location_edibles.update(location_params)
		#(address: params[:address], lat: params[:lat], lng: params[:lng], description: params[:description], loc_type: params[:loc_type], location_edible: params[:location][:edible], user_id: current_user.id)
			redirect_to location_path(@location)
		else
			render :edit
		end
	end
=end

	def destroy
    	@location = Location.find(params[:id])
    	if logged_in?
    		@location.destroy
    		flash[:notice] = "Location deleted."
    		redirect_to user_locations_path
    	else
    		flash.now[:notice] = "You cannot delete another people's entry."
    	end
  	end


	private

		def location_params
			params.require(:location).permit(:id, :address, :desscription, :lat, :lng, :user_id, :user_name, :loc_type, :edible_name, :edible_ids => [], location_edibles_attributes: [ :edible_id, edible: [:name]]) 
		end

		 #def own_location
  			#if !current_user == Location.current_user
    		#redirect_to @location, notice: "You cannot edit this location"
  		#end  
  	#end

	end