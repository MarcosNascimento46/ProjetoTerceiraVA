require 'test_helper'

class VagaTest < ActiveSupport::TestCase
  test "deve salvar vaga válida" do
    empregador = Empregador.create(nome: "Empresa ABC", cnpj: "12345678000100", endereco: "Rua 2, 456")
    vaga = Vaga.new(titulo: "Desenvolvedor Ruby", descricao: "Vaga para desenvolvedor", salario: 5000, empregador: empregador)
    assert vaga.save
  end

  test "não deve salvar vaga sem título" do
    empregador = Empregador.create(nome: "Empresa ABC", cnpj: "12345678000100", endereco: "Rua 2, 456")
    vaga = Vaga.new(descricao: "Vaga para desenvolvedor", salario: 5000, empregador: empregador)
    assert_not vaga.save
  end

  test "não deve salvar vaga sem salário" do
    empregador = Empregador.create(nome: "Empresa ABC", cnpj: "12345678000100", endereco: "Rua 2, 456")
    vaga = Vaga.new(titulo: "Desenvolvedor Ruby", descricao: "Vaga para desenvolvedor", empregador: empregador)
    assert_not vaga.save
  end

  test "deve validar a presença de empregador" do
    vaga = Vaga.new(titulo: "Desenvolvedor Ruby", descricao: "Vaga para desenvolvedor", salario: 5000)
    assert_not vaga.save
  end

  test "deve salvar vaga com empregador válido" do
    empregador = Empregador.create(nome: "Empresa ABC", cnpj: "12345678000100", endereco: "Rua 2, 456")
    vaga = Vaga.new(titulo: "Desenvolvedor Ruby", descricao: "Vaga para desenvolvedor", salario: 5000, empregador: empregador)
    assert vaga.valid?
  end
end
