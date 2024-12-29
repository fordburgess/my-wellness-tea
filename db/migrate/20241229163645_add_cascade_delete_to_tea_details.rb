class AddCascadeDeleteToTeaDetails < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :tea_details, :products

    add_foreign_key :tea_details, :products, on_delete: :cascade
  end
end
