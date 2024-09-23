require 'test_helper'

class CandidaturasControllerTest < ActionDispatch::IntegrationTest
  test "deve criar uma candidatura" do
    assert_difference('Candidatura.count') do
      post candidaturas_url, params: { candidatura: { candidato_id: candidatos(:one).id, vaga_id: vagas(:one).id } }
    end
    assert_redirected_to candidatura_path(Candidatura.last)
  end

  test "não deve criar candidatura com dados inválidos" do
    assert_no_difference('Candidatura.count') do
      post candidaturas_url, params: { candidatura: { candidato_id: "", vaga_id: vagas(:one).id } }
    end
    assert_response :unprocessable_entity
  end
end
