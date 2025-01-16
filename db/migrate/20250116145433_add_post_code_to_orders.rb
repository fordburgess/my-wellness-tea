class AddPostCodeToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :post_code, :string
  end
end
