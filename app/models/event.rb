class Event < ApplicationRecord
  belongs_to :routes
  has_many :participants
  has_one_attached :photo

  validates :description, :starttime, presence: true
end
