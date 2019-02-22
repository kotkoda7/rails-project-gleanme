class LocationsController < ApplicationController
	before_action :current_user, except: [:show, :index]
	before_action :ensure_login 
	skip_before_action :verify_authenticity_token


	def home
	end

	def index
	    if params[:user_id]
	      @user = User.find_by(id: params[:user_id])
	      @locations = User.find(params[:user_id]).locations
	      render 'users/index'
	    else
	      @locations = Location.all
	      render 'index'
	    end
	end

	def new
		#add a new location (aka user's location), must be logged in to do that!
		if current_user
			@user = User.find_by(id: params[:user_id])
			@location = Location.new(id: params[:user_id])
			@locations = Location.all
			@edible = Edible.new
			@edibles = @location.location_edibles.build
		else
			redirect_to locations_path, alert: "You must be logged in to create a location."
		end
	end

	def create
      @location = Location.new(location_params)
      @location.user = current_user

      if @location.save
          redirect_to user_locations_path(current_user)
      else
        redirect_to locations_path
      end
    end


	def edit
		 @location = Location.find(params[:id])
		 @edibles = @location.location_edibles
	 	@availability = @location.location_edibles
    		if @location.user == current_user
      			render 'edit'
    		else
      			redirect_to locations_path(@location), notice: "You can't edit someone else's location!"
    		end
	end

=begin
		#edit of location (by same user only)
#raise params.inspect
    	if current_user
			@user = User.find_by(id: params[:user_id])
			@location = Location.find_by(id: params[:id])
			#@location = Location.find_by(id: params[:id])
			@edibles = @location.location_edibles.all
			
			render 'edit'
			#redirect_to edit_user_location_path(current_user)
    	else
      		redirect_to locations_path, notice: "You can't edit someone else's location!"
 		end
=end



	def update
		 @location = Location.find(params[:id])
      if @location.update(location_params)
        redirect_to location_path(@location)
      else
        render 'edit'
      end
end
=begin
		@user = User.find_by(id: params[:user_id])
		@location = @user.locations.find_by(id: params[:id])
		
		if @location.save
			@location.update(location_params)
		#(address: params[:address], lat: params[:lat], lng: params[:lng], description: params[:description], loc_type: params[:loc_type], location_edible: params[:location][:edible], user_id: current_user.id)
			redirect_to location_path(@location)
		else
			render :edit
		end
=end


	def show
	 	@location = Location.find(params[:id])
	 	#@edible = Edible.find_by(params[:id])
	 	@edibles = @location.location_edibles.all
	 	@availability = @location.location_edibles.first
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
			params.require(:location).permit(:id, :address, :desscription, :lat, :lng, :description, :user_id, :user_name, :loc_type, :edible_name, :availability, :edible_ids => [], location_edibles_attributes: [ :edible_id, :availability, edible: [:name]]) 
		end
	end
