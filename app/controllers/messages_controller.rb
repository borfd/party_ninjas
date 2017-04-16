class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    NewCommentJob.perform_later "Lobby", current_user, body: params[:body]
  end
end
