class Plant < ApplicationRecord
  has_many_attached :images
  has_and_belongs_to_many :products, join_table: 'plants_products', dependent: :delete_all
end
