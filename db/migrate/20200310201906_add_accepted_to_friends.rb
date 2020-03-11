class AddAcceptedToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :accepted, :boolean, default: false
  end
end
