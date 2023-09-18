class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :equipment
  belongs_to :service

  STATUS_OPTIONS = ['Análise Crítica', 'Em Calibração', 'Calibração Rejeitada', 'Calibrado', 'Entregue']
  DOCUMENT_TYPE_OPTIONS = ['Certificado de Calibração', 'Relatório de Falha']
  ACCESSORIES_OPTIONS = ['Bolsa','Tampa painel frontal','Fonte', 'Cabo da Fonte', 'Cabos de teste','Pontas de teste','Mouse','Teclado','Visor para leitura','Manual de Serviço','Manual de Operação','Manual do Usuário','Em caixa','Em mala','Embalado','Não Embalado']

  validates :status, inclusion: {in: STATUS_OPTIONS}
  validates :date, presence: true
  
end
