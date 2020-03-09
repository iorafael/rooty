class Event < ApplicationRecord
  belongs_to :route
  has_one_attached :photo
  has_many :participants
  has_many :users, through: :participants
  validates :description, :starttime, :title, presence: true
end
