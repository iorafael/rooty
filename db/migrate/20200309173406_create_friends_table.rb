class CreateFriendsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :friends, id: false do |t|
      t.references :user, foreign_key: {to_table: :users}
      t.references :user_friend, foreign_key: {to_table: :users}
      # t.integer :user_id
      # t.integer :friend_user_id
    end

  #   add_index(:friends, [:user_id, :friend_user_id], :unique => true)
  #   add_index(:friends, [:friend_user_id, :user_id], :unique => true)
  end
end
