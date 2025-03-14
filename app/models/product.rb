class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many_attached :images
  has_and_belongs_to_many :plants, join_table: 'plants_products', dependent: :delete_all
end
