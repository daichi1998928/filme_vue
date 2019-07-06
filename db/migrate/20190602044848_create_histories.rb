class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
       t.integer :user_id, null: false
       t.string :shopping_postal_code
       t.string :shopping_prefecture
       t.string :shopping_city
       t.string :shopping_adress
       t.timestamps
    end
  end
end
