class RenameProductsIdToProductIdInTeaDetails < ActiveRecord::Migration[6.1]
  def change
    rename_column :tea_details, :products_id, :product_id
  end
end
