class Empregador < ApplicationRecord
    validates :nome, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :telefone, presence: true
    validates :empresa, presence: true
  end
  