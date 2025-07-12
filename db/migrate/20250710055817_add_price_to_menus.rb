class AddPriceToMenus < ActiveRecord::Migration[8.0]
  def change
    add_column :menus, :price, :integer
  end
end
