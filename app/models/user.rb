class User < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:name, :lastname, :username]

  has_many :routes

  has_many :friends

  has_many :participants
  has_many :events, through: :routes

  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
