class Event < ApplicationRecord
  belongs_to :route
  has_one_attached :photo
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants, dependent: :destroy
  validates :description, :starttime, :title, presence: true
end
