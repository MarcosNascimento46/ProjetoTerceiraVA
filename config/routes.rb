Rails.application.routes.draw do
  get "home/index"
  resources :candidatos
  resources :empregadores
  resources :vagas
  
  # Defina a página inicial (root) para redirecionar para a ação index de candidatos
  root 'candidatos#index'
end
