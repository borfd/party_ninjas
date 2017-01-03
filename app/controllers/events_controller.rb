class EventsController < ApplicationController
	def new
		@event = Event.new
	end

	def create 
		@event = Event.create!(event_params.merge(user: User.first))
		redirect_to event_path(@event)
	end

	def show
		@event = Event.find(params[:id])
	end

	private
	def event_params
		params.require(:event).permit(:title,:date,:description,:user,:place)
	end
end