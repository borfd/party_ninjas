class Message < ApplicationRecord
  after_create_commit :broadcast
  belongs_to :sent_by, class_name: User

  def broadcast
    NewCommentJob.perform_later "Lobby", sent_by, body
  end
end
