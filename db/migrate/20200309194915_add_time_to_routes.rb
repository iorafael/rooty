class AddTimeToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :time, :integer
  end
end