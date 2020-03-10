class AddTimeToNodes < ActiveRecord::Migration[6.0]
  def change
    add_column :nodes, :time, :integer
  end
end
