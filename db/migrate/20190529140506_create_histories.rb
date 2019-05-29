class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :user_id, null: false
      t.string :shopping_postal_code,null: false
      t.string :shopping_prefecture,null: false
      t.string :shopping_city,null: false
      t.string :shopping_adress,null: false
      t.timestamps
    end
  end
end
