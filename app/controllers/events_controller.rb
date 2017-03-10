class EventsController < ApplicationController
	before_action :authenticate_user!

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
		@event = Event.find(params[:id])
		@comment = Comment.new
	end

	def index
		@events = Event.all
	end

	def attend
		@event = Event.find(params[:event_id])
		current_user.attend(@event)
		redirect_to @event
	end

	private
	def event_params
		params.require(:event).permit(:title,:date,:description,:user,:place)
	end
end
