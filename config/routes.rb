Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:index, :new, :create, :show, :destroy]
  resources :users
  resources :carts, only: [:show]
  resource  :cart, only: [:show] do
          get :add, on: :member
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
