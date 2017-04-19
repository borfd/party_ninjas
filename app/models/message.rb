class Message < ApplicationRecord
  after_create_commit :broadcast
  belongs_to :sent_by, class_name: User

  def broadcast
    ActionCable.server.broadcast(
      "chat_#{room}",
      sent_by: sent_by.name,
      body: body,
      room: "Lobby"
    )
  end
end
