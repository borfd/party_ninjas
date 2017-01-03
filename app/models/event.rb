class Event < ApplicationRecord
  belongs_to :user
  validates :title, :place, :date, presence: true
end
