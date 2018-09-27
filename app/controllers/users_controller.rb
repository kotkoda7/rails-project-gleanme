class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
	    @user = User.new(user_params)
	    if @user.save
	      session[:user_id] = @user.id
	      redirect_to user_path(@user), notice: "You are signed up"
	    else
	      render 'new'
	    end
  	end

  	def edit
    	@user = find_by_id(User)
  	end

  	def update
	    @user = find_by_id(User)
	    redirect_to request.referer || root_path, alert: "You cannot update another user's name" unless current_user.can_edit?(@user)
	    if @user.update(user_params)
	      redirect_to user_path(@user), notice: "You updated #{@user.name}"
	    else
	      render :edit
	    end
  	end

  	def show
    	@user = find_by_id(User)
    	@locations = @user.locations
    end

    def user_params
    	params.require(:user).permit(:name, :password, :password_confirmation, :admin)
  	end
  end


