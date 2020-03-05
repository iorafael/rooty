class Event < ApplicationRecord
  belongs_to :route
  has_one_attached :photo
  has_many :participants
end
