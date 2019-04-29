class AddTrackNameToTracks < ActiveRecord::Migration[5.2]
  def up
    add_column :tracks, :product_id, :integer
    change_column :tracks, :product_id, :integer, :null => false

    add_column :tracks, :track_name, :string
    change_column :tracks, :track_name, :string, :null => false

    add_column :tracks, :artist_name, :string
    change_column :tracks, :artist_name, :string, :null => false

    add_column :tracks, :disk_num, :integer
    change_column :tracks, :disk_num, :integer, :null => false,default: 1

    add_column :tracks, :track_order, :integer
    change_column :tracks, :track_order, :integer, :null => false,default: 1

  end

  def down
    remove_column :tracks, :product_id
    remove_column :tracks, :track_name
    remove_column :tracks, :artist_name
    remove_column :tracks, :disk_num
    remove_column :tracks, :track_name
  end
end
