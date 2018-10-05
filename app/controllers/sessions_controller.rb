class SessionsController < ApplicationController

def new
  @user = User.new
end

def create
    @user = User.find_by(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, :notice => "You are logged in!"
    else
      flash.now.alert = "Invalid username or password"
      redirect_to login_path
    end
end




  def destroy
    #reset_session
    session.clear
    redirect_to login_path, :notice => "You are logged out!"
  end

end
