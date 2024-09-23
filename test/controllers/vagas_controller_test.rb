require 'test_helper'

class VagasControllerTest < ActionDispatch::IntegrationTest
  test "deve listar vagas" do
    get vagas_url
    assert_response :success
  end

  test "deve criar uma nova vaga" do
    empregador = empregadores(:one)
    assert_difference('Vaga.count') do
      post vagas_url, params: { vaga: { titulo: "Nova Vaga", descricao: "Teste", salario: 3000, empregador_id: empregador.id } }
    end
    assert_redirected_to vaga_path(Vaga.last)
  end

  test "não deve criar vaga com dados inválidos" do
    assert_no_difference('Vaga.count') do
      post vagas_url, params: { vaga: { titulo: "", descricao: "Teste", salario: 3000 } }
    end
    assert_response :unprocessable_entity
  end

  test "deve editar uma vaga" do
    vaga = vagas(:one)
    patch vaga_url(vaga), params: { vaga: { titulo: "Título Atualizado" } }
    assert_redirected_to vaga_path(vaga)
  end

  test "deve remover uma vaga" do
    vaga = vagas(:one)
    assert_difference('Vaga.count', -1) do
      delete vaga_url(vaga)
    end
    assert_redirected_to vagas_url
  end
end
