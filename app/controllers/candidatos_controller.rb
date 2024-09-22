class CandidatosController < ApplicationController
    def index
      @candidatos = Candidato.all
    end
  
    def show
      @candidato = Candidato.find(params[:id])
    end
  
    def new
      @candidato = Candidato.new
    end
  
    def create
      @candidato = Candidato.new(candidato_params)
      if @candidato.save
        redirect_to @candidato
      else
        render 'new'
      end
    end
  
    def edit
      @candidato = Candidato.find(params[:id])
    end
  
    def update
      @candidato = Candidato.find(params[:id])
      if @candidato.update(candidato_params)
        redirect_to @candidato
      else
        render 'edit'
      end
    end
  
    def destroy
      @candidato = Candidato.find(params[:id])
      @candidato.destroy
      redirect_to candidatos_path
    end
  
    private
  
    def candidato_params
      params.require(:candidato).permit(:nome, :email, :telefone)
    end
  end
  