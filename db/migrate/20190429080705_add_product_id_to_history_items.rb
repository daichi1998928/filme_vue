class AddProductIdToHistoryItems < ActiveRecord::Migration[5.2]
  def up
    add_column :history_items, :product_status , :integer
    change_column :history_items, :product_status , :integer, :null => false,default: 1

    add_column :history_items, :product_id , :integer
    change_column :history_items, :product_id , :integer, :null => false

    add_column :history_items, :product_price , :integer
    change_column :history_items, :product_price , :integer, :null => false

    add_column :history_items, :user_id , :integer
    change_column :history_items, :user_id , :integer, :null => false

    add_column :history_items, :history_id , :integer
    change_column :history_items, :history_id , :integer, :null => false



    add_column :history_items, :quantity , :integer

  end

  def down
    remove_column :history_items, :product_status
    remove_column :history_items, :product_id
    remove_column :history_items, :product_price
    remove_column :history_items, :user_id
    remove_column :history_items, :history_id

  end
end
