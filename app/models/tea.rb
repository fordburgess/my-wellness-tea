class Tea < Product
  has_one :tea_detail, foreign_key: "product_id"
  accepts_nested_attributes_for :tea_detail

  validates :title, :price, :stock, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :images, presence: true
  validates_associated :tea_detail
end
