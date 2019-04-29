class AddProductIdToProductReviews < ActiveRecord::Migration[5.2]

  def up
    add_column :product_reviews, :product_id, :integer
    change_column :product_reviews, :product_id, :integer, :null => false

    add_column :product_reviews, :user_id, :integer
    change_column :product_reviews, :user_id, :integer, :null => false

    add_column :product_reviews, :rate, :integer
    change_column :product_reviews, :rate, :integer, :null => false

  end

  def down
    remove_column :product_reviews, :product_id
    remove_column :product_reviews, :user_id
    remove_column :product_reviews, :rate

  end
end
