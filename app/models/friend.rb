class Friend < ApplicationRecord
  belongs_to :user,  class_name: "User", foreign_key: "user_id"
  belongs_to :user_friend, class_name: "User", foreign_key: "user_friend_id"

  def sender
    User.find(user_id)
  end

  def receiver
    User.find(user_friend_id)
  end

  def accept
    self.accepted = true
  end

end
