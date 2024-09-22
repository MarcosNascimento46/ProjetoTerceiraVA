class Vaga < ApplicationRecord
  belongs_to :empregador
  has_many :candidatos
  
  validates :titulo, presence: true
  validates :descricao, presence: true
  validates :salario, numericality: { greater_than: 0 }
end
