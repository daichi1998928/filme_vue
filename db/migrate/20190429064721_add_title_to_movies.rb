class AddTitleToMovies < ActiveRecord::Migration[5.2]
  def up
    add_column :movies, :image_id, :string
    change_column :movies, :image_id, :string, :null => false

    add_column :movies, :title, :string
    change_column :movies, :title, :string, :null => false

    add_column :movies, :url, :text

    add_column :movies, :detail, :text
    change_column :movies, :detail, :text, :null => false
  end


  def down
    remove_column :movies, :image_id
    remove_column :movies, :title
    remove_column :movies, :detail


  end


end
