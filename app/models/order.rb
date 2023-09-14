class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy

  validates :date, presence: true
end
