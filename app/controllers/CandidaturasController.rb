class CandidaturasController < ApplicationController
    before_action :set_vaga
  
    def create
      @candidatura = @vaga.candidaturas.new(candidato_id: current_user.id)
      if @candidatura.save
        redirect_to @vaga, notice: 'Você se candidatou com sucesso.'
      else
        redirect_to @vaga, alert: 'Erro ao candidatar-se para a vaga.'
      end
    end
  
    private
  
    def set_vaga
      @vaga = Vaga.find(params[:vaga_id])
    end
  end
  