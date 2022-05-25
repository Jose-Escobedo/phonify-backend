Rails.application.routes.draw do

  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  resources :users, only: [:index, :show, :create, :destroy, :update]
  resources :phones, only: [:index, :show]
  # get "/teams", to: "teams#index"
  # post "/login", to: "sessions#login"
  # post "/signup", to: "users#create"
  # get '/authorized_user', to: 'users#show'
  # delete '/logout', to: 'sessions#logout'
end
