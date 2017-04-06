class EventsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_event, only: [:show, :edit, :update, :destroy]
	before_action :set_all_events

	add_breadcrumb 'Events', 'events_path'

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params.merge(user: current_user))
		if @event.valid?
			current_user.attend(@event)
			@event.save!
			redirect_to event_path(@event), flash: {notice:"Your event has been added"}
		else
			render :new
		end
	end

	def show
		@comment = Comment.new
		add_breadcrumb @event.title, event_path(@event)
	end

	def index
		@events = upcoming_events
	end

	def edit
		add_breadcrumb @event.title, event_path(@event)
		add_breadcrumb "Edit", edit_event_path(@event)
	end

	def update
		@event.update_attributes(event_params)
		redirect_to @event
	end

	def attend
		@event = Event.find(params[:event_id])
		current_user.attend(@event)
		redirect_to @event
	end

	def destroy
		if current_user == @event.user
			@event.destroy
		end
		redirect_to events_path
	end

	def filter
		@events = EventCalendarService.new.filter(params[:filter])
		add_breadcrumb "#{params[:filter]}", filter_events_path(params[:filter])
		render :index
	end

	private
	def event_params
		params.require(:event).permit(:title, :date, :description, :user, :place)
	end

	def set_event
		@event = Event.find(params[:id])
	end

	def set_all_events
		@all_events = Event.all.order(:date)
	end

	def upcoming_events
		EventCalendarService.new().upcoming
	end
end
