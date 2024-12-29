class TeaDetail < ApplicationRecord
  belongs_to :product, optional: true
end
