class Equipment < ApplicationRecord
  belongs_to :client
  has_many :order_items, dependent: :restrict_with_exception
end
