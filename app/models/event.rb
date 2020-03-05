class Event < ApplicationRecord
<<<<<<< HEAD
  belongs_to :routes
=======
  belongs_to :route
  has_one_attached :photo 
  has_many :participants
>>>>>>> 1cb75b66dadd9cfe318caaf2e660026a9eb00a36
  has_many :users, through: :participants

  validates :description, :starttime, presence: true

end
