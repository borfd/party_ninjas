class EventLabel < ApplicationRecord
  belongs_to :label
  belongs_to :event
end
