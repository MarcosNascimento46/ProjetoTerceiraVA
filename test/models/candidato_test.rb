require 'test_helper'

class CandidatoTest < ActiveSupport::TestCase
  test "deve ter nome" do
    candidato = Candidato.new(email: "test@example.com", telefone: "12345678")
    assert_not candidato.save, "Salvou o candidato sem nome"
  end
end
