class Event < ApplicationRecord
  belongs_to :user
  validates :title, :place, :date, presence: true
  has_many :users, through: :user_events
  has_many :user_events
  has_many :comments, dependent: :destroy

  mount_uploader :header_image, HeaderImageUploader

  def expired?
    date < Date.today
  end

  def list_class
    expired? ? "past" : "future"
  end

  def date_format
    date.strftime("%a, %B %d %Y")
  end
end
