class AddPayMethodToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :pay_method, :integer
  end
end
