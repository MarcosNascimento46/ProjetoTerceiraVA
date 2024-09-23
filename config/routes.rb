Rails.application.routes.draw do
  # Rotas para gerenciamento de candidatos
  resources :candidatos

  # Rotas para candidaturas
  resources :vagas do
    resources :candidaturas, only: [:create]
  end

  # Rotas para empregadores
  resources :empregadores

  # Rotas para vagas
  resources :vagas

  # Rotas para usuários
  resources :users

  # Rotas para Devise (login/logout)
  devise_for :users
  
  # Rota raiz
  root to: 'home#index'
end
