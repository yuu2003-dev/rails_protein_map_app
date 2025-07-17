# frozen_string_literal: true

class CreateMenus < ActiveRecord::Migration[8.0]
  def change
    create_table :menus do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.float :protein
      t.float :calories
      t.text :description

      t.timestamps
    end
  end
end
