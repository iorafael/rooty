class CreatePaths < ActiveRecord::Migration[6.0]
  def change
    create_table :paths do |t|
      t.integer :distance
      t.string :startpoint
      t.string :endpoint
      t.datetime :time
      t.references :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
