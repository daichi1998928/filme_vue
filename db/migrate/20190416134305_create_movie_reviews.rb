class CreateMovieReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_reviews do |t|

      t.timestamps
    end
  end
end
