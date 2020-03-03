class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.integer :distance
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
