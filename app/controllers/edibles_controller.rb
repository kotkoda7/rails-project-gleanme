class EdiblesController < ApplicationController
	  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  

  def logged_in?
    !!current_user
  end

  private 

  def edible_params
    params.require(:edible).permit!
  end


end
