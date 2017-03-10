class EventsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params.merge(user: current_user))
		if @event.valid?
			@event.save!
			redirect_to event_path(@event), flash: {notice:"Your event has been added"}
		else
			render :new
		end
	end

	def show
		@comment = Comment.new
	end

	def index
		@events = Event.all
	end

	def edit

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

	private
	def event_params
		params.require(:event).permit(:title, :date, :description, :user, :place)
	end

	def set_event
		@event = Event.find(params[:id])
	end
end
