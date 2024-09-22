class Vaga < ApplicationRecord
    validates :titulo, presence: true
    validates :descricao, presence: true
    validates :empresa, presence: true
  end
  