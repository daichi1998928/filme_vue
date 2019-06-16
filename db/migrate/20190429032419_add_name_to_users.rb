class AddNameToUsers < ActiveRecord::Migration[5.2]

  def up
    add_column :users, :name, :string
    change_column :users, :name, :string, :null => false

    add_column :users, :phonetic_name, :string
    change_column :users, :phonetic_name, :string, :null => false

    add_column :users, :postal_code, :string
    change_column :users, :postal_code, :string, :null => false

    add_column :users, :prefecture, :string
    change_column :users, :prefecture, :string, :null => false

    add_column :users, :city, :string
    change_column :users, :city, :string, :null => false

    add_column :users, :adress, :string
    change_column :users, :adress, :string, :null => false

    add_column :users, :phone_number, :string
    change_column :users, :phone_number, :string, :null => false

    add_column :users, :image_id, :string,default: "/images/google_profile.jpeg"

    add_column :users, :deleted_at, :datetime

  end

  def down
    remove_column :users, :name
    remove_column :users, :phonetic_name
    remove_column :users, :postal_code
    remove_column :users, :prefecture
    remove_column :users, :city
    remove_column :users, :adress
    remove_column :users, :phone_number
  end



end
