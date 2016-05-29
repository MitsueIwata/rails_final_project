class EventsController < ApplicationController
	def index
		@events = Event.all
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
		@event.title = params['event'][:title]
		@event.location = params['event'][:location]
		@event.image_url = params[:event][:image_url]
		@event.start_time = params[:event][:start_time]
		@event.end_time = params[:event][:end_time]
		@event.allDay = params[:event][:allDay]
		@event.description = params['event'][:description]
		@event.event_category = params['event'][:event_category]
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
		event.title = params['event'][:title]
		event.location = params['event'][:location]
		event.image_url = params[:event][:image_url]
		event.start_time = params[:event][:start_time]
		event.end_time = params[:event][:end_time]
		event.allDay = params[:event][:allDay]
		event.description = params['event'][:description]
		event.event_category = params['event'][:event_category]
		event.color = params[:event][:color]
		event.save
		redirect_to event_path(event.id)
	end

end