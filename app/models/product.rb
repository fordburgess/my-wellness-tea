class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many_attached :images
end
