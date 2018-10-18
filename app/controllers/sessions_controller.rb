class SessionsController < ApplicationController

  def new
    #log in
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
      if @user.nil? || !@user.authenticate(params[:user][:password])
        flash.now[:notice] = "Your username or password is not correct"
        render :new
      else
        session[:user_id] = @user.id
        flash.now[:notice] = "You have successfully logged in"
        redirect_to user_locations_path(@user)
      end
    end


  def destroy
    session.clear
    flash.now[:notice] =  "You are logged out!"
    redirect_to root_path
  end

end
