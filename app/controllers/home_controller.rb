class HomeController < ApplicationController
  def index
    #redirect_to events_path
    @all_events = Event.order(:date)
    @featured_event = Event.where("date >= ?", Date.today).order(:date).first
  end

end
