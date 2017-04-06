class Label < ApplicationRecord
  has_many :event_labels
  has_many :events, through: :event_labels
end
