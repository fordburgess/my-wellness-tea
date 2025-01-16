class AddStreetAddressToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :street_address, :text
  end
end
