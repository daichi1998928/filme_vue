class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
       t.integer :user_id, null: false
       t.string :postal_code
       t.string :prefecture
       t.string :city
       t.string :adress
       t.timestamps
    end
  end
end
