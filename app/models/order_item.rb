class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :equipment
  belongs_to :service

  STATUS_OPTIONS = ['Análise Crítica', 'Em Calibração', 'Calibração Rejeitada', 'Calibrado', 'Entregue']

  validates :status, inclusion: {in: STATUS_OPTIONS}
  validates :date, presence: true
  
end
