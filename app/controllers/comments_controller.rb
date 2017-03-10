class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:event_id])
    event.comments.create!(comment_params.merge(user: current_user)).tap do |comment|
      redirect_to comment.event
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:comment)
  end
end