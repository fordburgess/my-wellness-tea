class AddWeightToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :weight, :float
  end
end
