class SessionsController < ApplicationController

def new
  @user = User.new
end

def create

user = User.find_by(params[:id])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "You are logged in!"
      else
       if user
          flash.now[:danger] = "Your username or password is incorrect!"
          render 'new'
      end
    end
  end


  def destroy
    #reset_session
    session.clear
    redirect_to login_path, :notice => "You are logged out!"
  end

end
