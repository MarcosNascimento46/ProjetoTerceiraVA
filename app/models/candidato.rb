class Candidato < ApplicationRecord
    validates :nome, presence: true
    validates :email, presence: true, uniqueness: true
    validates :telefone, presence: true
  end
  