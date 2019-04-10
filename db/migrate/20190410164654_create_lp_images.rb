class CreateLpImages < ActiveRecord::Migration[5.2]
  def change
    create_table :lp_images do |t|

      t.timestamps
    end
  end
end
