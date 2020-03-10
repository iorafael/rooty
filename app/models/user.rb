class User < ApplicationRecord
  has_many :routes

  # has_many :friends, dependent: :destroy
  has_many :user_friends, foreign_key: :user_friend_id, class_name: "Friend"
  has_many :friends, through: :user_friends
  # has_and_belongs_to_many :friends,  class_name: "User", join_table:  :friends, foreign_key: :user_id, association_foreign_key: :friend_user_id

  has_many :participants
  has_many :events, through: :routes

  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
