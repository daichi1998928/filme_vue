class AddCartIdToCartItems < ActiveRecord::Migration[5.2]
  def up
    add_column :cart_items, :cart_id, :integer
    change_column :cart_items, :cart_id, :integer, :null => false

    add_column :cart_items, :product_id, :integer
    change_column :cart_items, :product_id, :integer, :null => false

    add_column :cart_items, :quantity, :integer
    change_column :cart_items, :quantity, :integer ,default: 1
  end

  def down
    remove_column :cart_items, :cart_id
    remove_column :cart_items, :product_id
    remove_column :cart_items, :quantity
  end
end
