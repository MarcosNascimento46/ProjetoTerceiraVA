require 'test_helper'

class EmpregadorTest < ActiveSupport::TestCase
  test "deve salvar empregador válido" do
    empregador = Empregador.new(nome: "Empresa XYZ", cnpj: "12345678000100", endereco: "Rua 1, 123")
    assert empregador.save
  end

  test "não deve salvar empregador sem nome" do
    empregador = Empregador.new(cnpj: "12345678000100", endereco: "Rua 1, 123")
    assert_not empregador.save
  end

  test "não deve salvar empregador sem CNPJ" do
    empregador = Empregador.new(nome: "Empresa XYZ", endereco: "Rua 1, 123")
    assert_not empregador.save
  end
end
