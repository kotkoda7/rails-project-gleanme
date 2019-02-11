class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :ensure_login, :set_user

    def set_user
      @user = User.find(params[:user_id])
    end

  def current_user
      User.find_by(id: session[:user_id]) if session[:user_id]
    end

  def logged_in?
    session[:user_id]
  end

  def ensure_login 
    unless session.include? :user_id
          redirect_to '/'
        flash[:message] = "Please sign up or log in!"
      end
  end

  def authorize_user
      unless @user == current_user
          redirect_to root_path 
        flash[:message] = "You can only do this action if if you created the location!"
      #some error message would be useful
    end
  end

end




