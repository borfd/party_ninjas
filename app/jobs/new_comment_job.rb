class NewCommentJob < ApplicationJob

  def perform(room, user, body)
    ActionCable.server.broadcast(
      "chat_#{room}",
      sent_by: user.name,
      body: body,
      room: room
    )
  end
end
