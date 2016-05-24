class CommunitiesController < ApplicationController
	def show
	    @comm = Community.find_by(id: params[:id])
    	if !@comm #|| (@user.id != session[:user_id].to_i)
      		redirect_to root_url
      	end
	end

	def create
	end

	def new
	end

	def edit
    	@comm = Community.find_by(id: params[:id])
  	end

	def update
		comm = Community.find_by(id: params[:id])
		comm.comm_name = params[:comm_name]
		comm.organizer = params[:organizer]
		comm.comm_category = params[:comm_category]
		comm.location = params[:location]
		comm.description = params[:description]
		comm.save
		redirect_to root_url#communities_url(@comm)
	end


	def index
		@community = Community.all
	end
end
