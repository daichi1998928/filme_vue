class AddJugeUserToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :juge_use, :boolean, default: true
  end
end
