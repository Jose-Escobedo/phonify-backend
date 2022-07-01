Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }

  get 'Cart', to: "sessions#load_cart"
  post 'Cart/add_to_cart/:phone_id', to: "sessions#add_to_cart"
  patch 'Cart/add_quantity/:phone_id', to: "sessions#add_quantity"
  delete 'Cart/remove_from_cart/:phone_id', to: "sessions#remove_from_cart"

  resources :phones, only: [:index, :show], param: :phone_id

  # post "/login", to: "sessions#login"
  # post "/signup", to: "users#create"
  # get '/authorized_user', to: 'users#show'
  # delete '/logout', to: 'sessions#logout'
end
