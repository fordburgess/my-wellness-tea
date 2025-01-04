class AddCategoryToTeaDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :tea_details, :category, :string
  end
end
