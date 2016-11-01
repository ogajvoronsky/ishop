Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [ :index, :new, :create, :show, :destroy ]
  resources :users
  #resources :carts, only: [ :show, :destroy ]
  resource  :cart, only: [ :show, :destroy ] do
          get :add, on: :member
  end
  resource :carts, only: [ :show, :destroy ] do
    post :destroy, on: :member
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
