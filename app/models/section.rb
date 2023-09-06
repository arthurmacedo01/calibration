class Section < ApplicationRecord
  has_many :services, dependent: :restrict_with_exception
end
