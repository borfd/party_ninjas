class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_events = Event.order(:date)
    @featured_event = Event.where("date >= ?", Date.today).order(:date).first
  end

end
