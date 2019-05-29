class AddUserIdToHistories < ActiveRecord::Migration[5.2]
  def up
    add_column :histories, :user_id, :integer
    change_column :histories, :user_id, :integer, :null => false
  end

  def down
    remove_column :histories, :user_id
  end
end
