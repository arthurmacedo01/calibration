class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :equipment
  belongs_to :service

  STATUS_OPTIONS = ['Análise Crítica', 'Calibração Rejeitada', 'Calibrado']

  validates :status, inclusion: {in: STATUS_OPTIONS}
end
