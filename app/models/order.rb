class Order < ApplicationRecord
  has_many :order_items, dependent: :restrict_with_exception
end
