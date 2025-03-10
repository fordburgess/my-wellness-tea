class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user, optional: true
  attr_accessor :first_name, :last_name, :address_line_1, :address_line_2

  def order_total
    line_items.sum { |item| item.quantity * item.product.price }
  end
end
