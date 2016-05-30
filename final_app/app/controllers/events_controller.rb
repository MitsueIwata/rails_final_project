class EventsController < ApplicationController
	def index
		@events = Event.all
		if params[:keyword].present?
        @events = @events.where("title LIKE ? OR description LIKE ?",
                                             "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    	end
    	@events = @events.limit(100)

		respond_to do |format|
	      format.html do
	        render 'index'
	      end
	      format.json do
	        render json: @movies
	      end
	      format.xml do
	        render xml: @movies
	      end
		end

	end
	def show
		@event = Event.find_by(id: params[:id])
		if @event == nil
			redirect_to root_url
		end
		respond_to do |format|
			format.html do
				session[:event_id] = @event.id
			end
			format.json do
				render json: @event
			end
		end
	end

	def new
		@event = Event.new 
	end

	def create
		@event = Event.new

		new_start_date = DateTime.new(params[:event]["start_time(1i)"].to_i, 
                        params[:event]["start_time(2i)"].to_i,
                        params[:event]["start_time(3i)"].to_i,
                        params[:event]["start_time(4i)"].to_i,
                        params[:event]["start_time(5i)"].to_i)
		new_end_date = DateTime.new(params["end_time(1i)"].to_i, 
                        params[:event]["end_time(2i)"].to_i,
                        params[:event]["end_time(3i)"].to_i,
                        params[:event]["end_time(4i)"].to_i,
                        params[:event]["end_time(5i)"].to_i)

		@event.title = params['event'][:title]
		@event.location = params['event'][:location]
		@event.image_url = params[:event][:image_url]
		@event.start_time = new_start_date
		@event.end_time = new_end_date
		@event.allDay = params[:event][:allDay]
		@event.description = params['event'][:description]
		@event.event_category = params['event'][:event_category]
		@event.user_id = session[:user_id]
		@event.community_id = params['event'][:community_id]

	    if @event.save
	      redirect_to event_path(@event.id), notice: "Community added! Thanks!"
	    else
	      # redirect_to new_movie_url, notice: "Something went wrong!"
	      render 'new'
	    end

	end

	def edit
		@event = Event.find_by(id: params[:id])
	end


	def update
		event = Event.find_by(id: params[:id])

		new_start_date = DateTime.new(params[:event]["start_time(1i)"].to_i, 
                        params[:event]["start_time(2i)"].to_i,
                        params[:event]["start_time(3i)"].to_i,
                        params[:event]["start_time(4i)"].to_i,
                        params[:event]["start_time(5i)"].to_i)
		new_end_date = DateTime.new(params["end_time(1i)"].to_i, 
                        params[:event]["end_time(2i)"].to_i,
                        params[:event]["end_time(3i)"].to_i,
                        params[:event]["end_time(4i)"].to_i,
                        params[:event]["end_time(5i)"].to_i)

		event.title = params[:event][:title]
		event.location = params[:event][:location]
		event.image_url = params[:event][:image_url]
		event.start_time = new_start_date
		event.end_time = new_end_date
		event.allDay = params[:event][:allDay]
		event.description = params[:event][:description]
		event.event_category = params[:event][:event_category]		
		event.save
		redirect_to event_path(event.id)
	end
end