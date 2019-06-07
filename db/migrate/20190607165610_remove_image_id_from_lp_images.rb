class RemoveImageIdFromLpImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :lp_images, :image_id, :integer
    add_column :lp_images, :image_id, :integer
  end
end
