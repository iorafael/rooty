class AddIdToFriend < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :id, :primary_key
  end
end
