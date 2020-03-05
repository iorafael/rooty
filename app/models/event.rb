class Event < ApplicationRecord

  belongs_to :routes
  has_many :users, through: :participants

  validates :description, :starttime, presence: true

end
