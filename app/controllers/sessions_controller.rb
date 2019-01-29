class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    password = params[:user][:password]
      if user && user.authenticate(password)
        session[:user_id] = user.id
        redirect_to root_path, notice: "You have successfully logged in"
      else
        flash[:alert] = "Your username or password is not correct"
        redirect_to login_path
      end
    end


  def destroy
    session.clear
    redirect_to login_path, :notice => "You are logged out!"
  end

end