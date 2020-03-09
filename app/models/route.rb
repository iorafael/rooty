class Route < ApplicationRecord
  belongs_to :user
  has_many :nodes, dependent: :destroy
  has_many :events, dependent: :destroy

  def display_distance
    self.distance < 1000 ? "#{distance} meters" : "#{distance / 1000.0} kilometers"
  end
end
