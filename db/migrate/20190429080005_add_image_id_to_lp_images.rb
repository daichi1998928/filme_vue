class AddImageIdToLpImages < ActiveRecord::Migration[5.2]
  def up
    add_column :lp_images, :image_id, :integer
    change_column :lp_images, :image_id, :integer,:null => false,default: "/images/NoImage.jpeg"
  end

  def down
    remove_column :lp_images, :image_id
  end
end
