Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:index, :new, :create, :show, :destoy]
  resources :users
  resources :carts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
