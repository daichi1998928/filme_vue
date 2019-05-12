class AddUserIdToFavorites < ActiveRecord::Migration[5.2]

  def up
    add_column :favorites, :user_id, :integer
    change_column :favorites, :user_id, :integer, :null => false

    add_column :favorites, :product_id, :integer
    change_column :favorites, :product_id, :integer, :null => false
  end

  def down
    remove_column :favorites, :user_id
    remove_column :favorites, :product_id

  end


end
