class CommunitiesController < ApplicationController
	def show
	    @comm = Community.find_by(id: params[:id])
    	if !@comm #|| (@user.id != session[:user_id].to_i)
      		redirect_to root_url
      	end

      	@events = Event.where(community_id: @comm.id)
		respond_to do |format| 
	      format.html
	      format.json { render :json => @events } 
	    end

	end

	def create
		@comm = Community.new
	    @comm.comm_name = params[:community][:comm_name]
	    @comm.comm_category = params[:community][:comm_category]
	    @comm.image_url = params['community'][:image_url]
		@comm.color_id = params[:community][:color_id]
	    @comm.organizer = params[:community][:organizer]
	    @comm.location = params[:community][:location]
	    @comm.description = params[:community][:description]
	    @u_id = session[:user_id]
	    if @comm.save
	      redirect_to community_path(@comm.id), notice: "Community added! Thanks!"
	    else
	      # redirect_to new_movie_url, notice: "Something went wrong!"
	      render 'new'
	    end
	end

  	def new
		@comm = Community.new
	end

	def edit
    	@comm = Community.find_by(id: params[:id])
  	end

	def update
		comm = Community.find_by(id: params[:id])
		comm.comm_name = params['community'][:comm_name]
		comm.image_url = params['community'][:image_url]
		comm.organizer = params['community'][:organizer]
		comm.comm_category = params['community'][:comm_category]
		comm.color_id = params[:community][:color_id]
		comm.location = params['community'][:location]
		comm.description = params['community'][:description]
		comm.save

		events = Event.where(community_id: comm.id)
		events.update_all(color: comm.color_id)

		redirect_to community_path(comm.id)
	end


	def index
		@community = Community.all
	end
end
