class Event < ApplicationRecord
  belongs_to :routes
  has_many :participants

  validates :description, :starttime, presence: true
end
