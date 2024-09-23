require 'test_helper'

class CandidatoTest < ActiveSupport::TestCase
  test "deve salvar candidato válido" do
    candidato = Candidato.new(nome: "Carlos Silva", email: "carlos@example.com", cpf: "12345678901")
    assert candidato.save
  end

  test "não deve salvar candidato sem nome" do
    candidato = Candidato.new(email: "carlos@example.com", cpf: "12345678901")
    assert_not candidato.save
  end

  test "não deve salvar candidato com email inválido" do
    candidato = Candidato.new(nome: "Carlos Silva", email: "emailinvalido", cpf: "12345678901")
    assert_not candidato.save
  end

  test "não deve salvar candidato sem cpf" do
    candidato = Candidato.new(nome: "Carlos Silva", email: "carlos@example.com")
    assert_not candidato.save
  end

  test "deve salvar candidato com cpf válido" do
    candidato = Candidato.new(nome: "Carlos Silva", email: "carlos@example.com", cpf: "12345678901")
    assert candidato.valid?
  end
end
