require 'test_helper'

class EmpregadoresControllerTest < ActionDispatch::IntegrationTest
  test "deve listar empregadores" do
    get empregadores_url
    assert_response :success
  end

  test "deve criar empregador" do
    assert_difference('Empregador.count') do
      post empregadores_url, params: { empregador: { nome: "Empresa XYZ", cnpj: "12345678000100", endereco: "Rua 1, 123" } }
    end
    assert_redirected_to empregador_path(Empregador.last)
  end

  test "não deve criar empregador com dados inválidos" do
    assert_no_difference('Empregador.count') do
      post empregadores_url, params: { empregador: { nome: "", cnpj: "12345678000100", endereco: "Rua 1, 123" } }
    end
    assert_response :unprocessable_entity
  end
end
