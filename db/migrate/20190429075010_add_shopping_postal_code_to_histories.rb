class AddShoppingPostalCodeToHistories < ActiveRecord::Migration[5.2]

  def up
    add_column :histories, :shopping_postal_code, :string
    change_column :histories, :shopping_postal_code, :string, :null => false

    add_column :histories, :shopping_prefecture, :string
    change_column :histories, :shopping_prefecture, :string, :null => false

    add_column :histories, :shopping_city, :string
    change_column :histories, :shopping_city, :string, :null => false

    add_column :histories, :shopping_adress, :string
    change_column :histories, :shopping_adress, :string, :null => false
  end

  def down
    remove_column :histories, :shopping_postal_code
    remove_column :histories, :shopping_prefecture
    remove_column :histories, :shopping_city
    remove_column :histories, :shopping_adress
  end
end
