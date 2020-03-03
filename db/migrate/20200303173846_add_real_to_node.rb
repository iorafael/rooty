class AddRealToNode < ActiveRecord::Migration[6.0]
  def change
    add_column :nodes, :real, :boolean
  end
end
