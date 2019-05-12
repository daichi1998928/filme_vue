class AddProductTitleToProducts < ActiveRecord::Migration[5.2]
  def up
    add_column :products, :image_id, :string
    change_column :products, :image_id, :string, :null => false

    add_column :products, :product_title, :string
    change_column :products, :product_title, :string, :null => false
    add_index :products, :product_title

    add_column :products, :price, :integer
    change_column :products, :price, :integer, :null => false

    add_column :products, :label_name, :string
    change_column :products, :label_name, :string, :null => false

    add_column :products, :stock, :integer
    change_column :products, :stock, :integer, :null => false
  end



  def down
    remove_column :products, :image_id
    remove_column :products, :product_title
    remove_column :products, :price
    remove_column :products, :label_name
    remove_column :products, :stock

  end
end
