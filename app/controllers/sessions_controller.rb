class SessionsController < ApplicationController


def create

    user = User.find_by(params[:id])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/locations', :notice => "You are logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "users/new"
    end
end

=begin
  if params[:username].present?
      @user = User.find_by_email(params[:username])
        if @user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to '/locations', :notice => "You are logged in!"
        else
          flash.now.alert = "Invalid email or password"
          render 'new'
    else
      flash.now.alert = "Invalid email or password"
      render 'new'
    end
end
=end

  def destroy
    session.clear
    redirect_to '/', :notice => "You are logged out!"
  end
end
