class Event < ApplicationRecord
  belongs_to :user
  validates :title, :place, :date, presence: true
  has_many :users, through: :user_events
  has_many :user_events
end
