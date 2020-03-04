class Route < ApplicationRecord
  belongs_to :user
  has_many :nodes, dependent: :destroy
end
