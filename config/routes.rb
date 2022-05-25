Rails.application.routes.draw do


  # resources :users, only: [:index, :show, :create, :destroy, :update]
  resources :phones, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
  # get "/teams", to: "teams#index"
  # post "/login", to: "sessions#login"
  # post "/signup", to: "users#create"
  # get '/authorized_user', to: 'users#show'
  # delete '/logout', to: 'sessions#logout'
end
