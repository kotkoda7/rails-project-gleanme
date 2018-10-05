class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :destroy]
	before_action :authorize_user, only: [:edit, :update, :destroy]
	
	def new
		@user = User.new
	end

	def index
		@user = User.find(params[:id])
		@locations = @user.locations
		redirect_to user_locations_path
	end

	def create
	    @user = User.new(user_params)
	    if @user.save
	      session[:user_id] = @user.id
	      redirect_to root_path, notice: "You are signed up"
	      #redirect_to 'user_path(@user)'
	    else
	      render 'new'
	    end
  	end

  	def show
  		@user = User.find(params[:id])
     	@locations = @user.locations 
    	@edibles = @user.edibles
    	@edible = Recipe.new
    	@edibles = 3.times.map { @edibles.build }
    end

private

    def user_params
    	params.require(:user).permit(:username, :password, :password_confirmation)
  	end

  	def authorize_user
      redirect_to root_path unless @user == current_user
      #some error message would be useful
    end
  end


