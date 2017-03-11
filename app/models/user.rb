class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events, through: :user_events
  has_many :user_events

  validates :name, presence: true

  def attend(event)
    event.users << self
  end

  def can_attend?(event)
    !events.include?(event)
  end

  def can_edit?(event)
    admin? || event.user == self
  end
end
