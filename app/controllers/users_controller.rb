class UsersController < ApplicationController
	#before_action :set_user, only: [:edit, :update, :destroy]
	#before_action :ensure_login, only: [:edit, :update, :destroy]
	#before_action :euthorize_user, only: [:edit, :update, :destroy]

	def index
		# list of user's entered locations
		@user = User.find(params[:id])
		@locations = @user.locations
		redirect_to user_locations_path(current_user)
	end

	 def show
	 	#user's (show of) specific location 
  		#@user = User.find(params[:id])
     	#@location = Location.find[:id]
     	#@locations = Location.all
     	@location = Location.find(params[:id])
     	@edible = Edible.find(params[:id])
     	@edibles = @location.edible_locations.all
     	#@edibles = EdibleLocation.find(params[:id])
     	#@location = @user.locations.find(params[:id])
     	#@edible = @location.edible_locations.find(params[:id])

     	#redirect_to user_location_path(current_user)
    end

    def new
    	#sign up
		@user = User.new
	end


	def create
	    @user = User.new(user_params)
	    if @user.save
	      session[:user_id] = @user.id
	      flash.now[:notice] = "You are signed up"
	      redirect_to user_path(@user)
	    else
		  flash.now[:notice] = "Unable to create account."
	      render 'new'
	    end
  	end

 

private

    def user_params
    	params.require(:user).permit(:username, :password, :location_address, :location_lat, :location_lng, :location_description, :edible_name, :edible_ids => [], edible_locations_attributes: [ :edible_id, edible: [:name]])
  	end

  	
 end


