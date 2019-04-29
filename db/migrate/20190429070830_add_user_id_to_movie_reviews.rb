class AddUserIdToMovieReviews < ActiveRecord::Migration[5.2]

  def up
    add_column :movie_reviews, :movie_id, :integer
    change_column :movie_reviews, :movie_id, :integer, :null => false

    add_column :movie_reviews, :user_id, :integer
    change_column :movie_reviews, :user_id, :integer, :null => false

    add_column :movie_reviews, :rate, :integer
    change_column :movie_reviews, :rate, :integer, :null => false
  end

  def down
    remove_column :movie_reviews, :movie_id
    remove_column :movie_reviews, :user_id
    remove_column :movie_reviews, :rate
  end



end
