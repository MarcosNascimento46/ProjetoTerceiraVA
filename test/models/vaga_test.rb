require 'test_helper'

class VagaTest < ActiveSupport::TestCase
  test "deve salvar vaga com todos os campos válidos" do
    vaga = Vaga.new(titulo: "Desenvolvedor Ruby", descricao: "Vaga para desenvolvedor", salario: 5000, empregador: Empregador.first)
    assert vaga.save
  end

  test "não deve salvar vaga sem título" do
    vaga = Vaga.new(descricao: "Vaga para desenvolvedor", salario: 5000, empregador: Empregador.first)
    assert_not vaga.save
  end
end
