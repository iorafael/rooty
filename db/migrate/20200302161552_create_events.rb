class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :description
      t.datetime :starttime
      t.references :routes, null: false, foreign_key: true

      t.timestamps
    end
  end
end
