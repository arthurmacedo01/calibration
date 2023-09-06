class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :equipment
  belongs_to :service
end
