class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
 
    session[:user_id] = @user.id
 
    render 'users/show'
  end

=begin


  def create
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_from_auth_hash(auth)
      session[:user_id] = user.id

      redirect_to root_path

    else
       user = User.find_by(username: params[:user][:username])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: "You have successfully logged in"
      else
        flash[:alert] = "Your username or password is not correct"
        #redirect_to login_path
        render 'sessions/new'
      end
  end
end



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


  def create
    
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
 
    session[:user_id] = @user.id
 
    render 'locations/home'
  end
=end

  def destroy
    session.clear
    redirect_to login_path, :notice => "You are logged out!"
  end
 
private
 
  def auth
    request.env['omniauth.auth']
  end

end