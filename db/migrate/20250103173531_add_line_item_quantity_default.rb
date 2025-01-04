class AddLineItemQuantityDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :line_items, :quantity, 1
  end
end
