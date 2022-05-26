Rails.application.routes.draw do

  resources :phones, only: [:index, :show]

  post "/login", to: "sessions#login"
  post "/signup", to: "users#create"
  get '/authorized_user', to: 'users#show'
  delete '/logout', to: 'sessions#logout'

end
