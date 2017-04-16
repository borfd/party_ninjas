class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    Message.create!(sent_by: current_user, room: "Lobby", body: params[:body])
    head :created
  end
end
