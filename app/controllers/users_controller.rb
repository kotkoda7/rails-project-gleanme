class UsersController < ApplicationController
	#before_action :set_user, only: [:edit, :update, :destroy]
	before_action :authorize_user, only: [:edit, :update, :destroy]
	

	def index
		@user = User.find(params[:id])
		@locations = @user.locations
	end

	 def show
  		@user = User.find(params[:id])
     	@locations = @user.locations 
     	#@location = @user.location
     	redirect_to user_locations_path(current_user)
    end

    def new
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
    	params.require(:user).permit(:username, :password)
  	end

  	def authorize_user
      redirect_to root_path unless @user == current_user
      #some error message would be useful
    end
  end


