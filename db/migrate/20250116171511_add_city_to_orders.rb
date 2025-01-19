class AddCityToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :city, :string
  end
end
