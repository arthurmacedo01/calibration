class Order < ApplicationRecord
  has_many :order_items, dependent: :restrict_with_exception

  validates :date, presence: true
end
