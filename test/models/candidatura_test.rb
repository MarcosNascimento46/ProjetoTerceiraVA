require 'test_helper'

class CandidaturaTest < ActiveSupport::TestCase
  test "deve salvar candidatura válida" do
    candidatura = Candidatura.new(candidato_id: candidatos(:one).id, vaga_id: vagas(:one).id)
    assert candidatura.save
  end

  test "não deve salvar candidatura sem candidato" do
    candidatura = Candidatura.new(vaga_id: vagas(:one).id)
    assert_not candidatura.save
  end

  test "não deve salvar candidatura sem vaga" do
    candidatura = Candidatura.new(candidato_id: candidatos(:one).id)
    assert_not candidatura.save
  end

  test "deve salvar candidatura com vaga e candidato válidos" do
    candidatura = Candidatura.new(candidato_id: candidatos(:one).id, vaga_id: vagas(:one).id)
    assert candidatura.valid?
  end
end
