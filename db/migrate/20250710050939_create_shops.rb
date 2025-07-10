class CreateShops < ActiveRecord::Migration[8.0]
  def change
    create_table :shops do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :description

      t.timestamps
    end
  end
end
