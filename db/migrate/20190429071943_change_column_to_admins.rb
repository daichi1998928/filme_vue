class ChangeColumnToAdmins < ActiveRecord::Migration[5.2]
  def up

    change_column :admins, :name, :string, null: false
  end

  def down
    change_column :admins, :name
  end
end
