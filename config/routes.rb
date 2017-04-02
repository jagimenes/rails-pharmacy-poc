Rails.application.routes.draw do
  resources :especialidades
  resources :formulas
  resources :pedidos do 
      get 'export'
    end
  resources :produtos
  resources :unidades
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
