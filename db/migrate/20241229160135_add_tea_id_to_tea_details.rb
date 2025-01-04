class AddTeaIdToTeaDetails < ActiveRecord::Migration[6.1]
  def change
    add_reference :tea_details, :products, foreign_key: true
  end
end
