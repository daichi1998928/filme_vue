class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  #カラム名の変更
  def change
    rename_column :users, :password, :encrypted_password
  end
end
