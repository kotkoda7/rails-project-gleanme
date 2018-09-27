class SessionsController < ApplicationController

	def new
	end

	def create
		if params[:name].present?
	      user = User.find_by_name(params[:name])
	      if user && user.authenticate(params[:password])
	        session[:user_id] = user.id
	        redirect_to user_path(user), alert: "You have successfully logged in"
	      else
	       if user
	          flash[:alert] = "Your password is incorrect"
	        else 
	          flash[:alert] = "The username is invalid"
	       end
	        render 'new'
	      end
	    end

	    def destroy
    		session.clear
    		redirect_to '/', alert: "You have successfully logged out"
  		end
end
