class Friend < ApplicationRecord
<<<<<<< HEAD
  include PgSearch::Model
  multisearchable against: [:user_id]
  belongs_to :user
=======
  belongs_to :user,  class_name: "User", foreign_key: "user_id"
  belongs_to :user_friend, class_name: "User", foreign_key: "user_friend_id"
>>>>>>> 6e740b21692ba18a4f20afd7a6af3eef11d2f26a
end
