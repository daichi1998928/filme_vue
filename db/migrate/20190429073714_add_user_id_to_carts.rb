class AddUserIdToCarts < ActiveRecord::Migration[5.2]

  def up
    add_column :carts, :user_id, :integer
    change_column :carts, :user_id, :integer, :null => false
  end

  def down
    remove_column :carts, :user_id
  end
end
