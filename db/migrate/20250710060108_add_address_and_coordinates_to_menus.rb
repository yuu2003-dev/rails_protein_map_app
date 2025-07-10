class AddAddressAndCoordinatesToMenus < ActiveRecord::Migration[8.0]
  def change
    add_column :menus, :address, :string
    add_column :menus, :latitude, :float
    add_column :menus, :longitude, :float
  end
end
