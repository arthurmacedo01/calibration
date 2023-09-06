class Client < ApplicationRecord
  has_many :equipments, dependent: :restrict_with_exception
end
