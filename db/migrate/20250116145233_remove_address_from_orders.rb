class RemoveAddressFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :address
  end
end
