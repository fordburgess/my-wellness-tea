class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  attr_accessor :first_name, :last_name, :address_line_1, :address_line_2


end
