class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :description
      t.datetime :starttime
      t.references :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
