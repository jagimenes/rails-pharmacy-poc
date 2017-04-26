Rails.application.routes.draw do
  
  resources :veiculos
  resources :especialidades
  resources :formulas
  resources :pedidos
  resources :update_produtos do
   get 'update_produtos'  , as: 'update_produtos'
  end
  resources :update_formulas do
   get 'update_formulas'  , as: 'update_formulas'
  end  
  resources :update_ingredientes do
   get 'update_ingredientes'  , as: 'update_ingredientes'
  end  
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
    get "/editar/:id" => "users#editar", as: :editar_usuario
end