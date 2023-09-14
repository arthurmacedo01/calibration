class Service < ApplicationRecord
  belongs_to :section
  has_many :order_items, dependent: :restrict_with_exception
  validates :code, presence: true

end
