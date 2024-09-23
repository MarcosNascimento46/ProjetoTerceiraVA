require 'test_helper'

class CandidatosControllerTest < ActionDispatch::IntegrationTest
  test "deve listar candidatos" do
    get candidatos_url
    assert_response :success
  end

  test "deve criar um candidato" do
    assert_difference('Candidato.count') do
      post candidatos_url, params: { candidato: { nome: "Carlos Silva", email: "carlos@example.com", cpf: "12345678901" } }
    end
    assert_redirected_to candidato_path(Candidato.last)
  end

  test "não deve criar candidato com dados inválidos" do
    assert_no_difference('Candidato.count') do
      post candidatos_url, params: { candidato: { nome: "", email: "carlos@example.com", cpf: "12345678901" } }
    end
    assert_response :unprocessable_entity
  end

  test "deve editar um candidato" do
    candidato = candidatos(:one)
    patch candidato_url(candidato), params: { candidato: { nome: "Nome Atualizado" } }
    assert_redirected_to candidato_path(candidato)
  end

  test "deve remover um candidato" do
    candidato = candidatos(:one)
    assert_difference('Candidato.count', -1) do
      delete candidato_url(candidato)
    end
    assert_redirected_to candidatos_url
  end
end
