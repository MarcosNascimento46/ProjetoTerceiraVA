require 'test_helper'

class CandidatosControllerTest < ActionDispatch::IntegrationTest
  test "deve criar candidato" do
    post candidatos_url, params: { candidato: { nome: 'John Doe', email: 'john@example.com', telefone: '12345678' } }
    assert_redirected_to candidato_path(Candidato.last)
  end
end
