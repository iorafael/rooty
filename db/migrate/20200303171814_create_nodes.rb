class CreateNodes < ActiveRecord::Migration[6.0]
  def change
    create_table :nodes do |t|
      t.float :distance, default: 0
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :name
      t.references :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
