class UsersController < ApplicationController
	def show
	    @user = User.find_by(id: params[:id])
    	if !@user || (@user.id != session[:user_id].to_i)
      		redirect_to root_url
      	end


      	@events = Event.where(user_id: @user.id)
		respond_to do |format| 
	      format.html
	      format.json { render :json => @events } 
	    end
	end
	
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		user = User.new
		user.username = params[:user][:username]
		user.email = params[:user][:email]
		user.password = params[:user][:password]
		user.save
		redirect_to root_url
		#redirct_to profile_url
	end

	def destroy
		User.delete(params[:id])
		redirect_to users_url
	end
end