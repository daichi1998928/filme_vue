class AddJugeUseToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :juge_use, :boolean, default: true
  end
end
