class Product < ApplicationRecord
  has_many :cart_items
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end