class Tea < Product
  has_one :tea_detail, foreign_key: "product_id"
  accepts_nested_attributes_for :tea_detail
end
