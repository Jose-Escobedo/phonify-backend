Rails.application.routes.draw do
  get 'carts/:id',to: "carts#show"
  delete 'carts/:id', to: "carts#destroy"
  
  # post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  # post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  # post 'line_items' => "line_items#create"
  # get 'line_items/:id' => "line_items#show", as: "line_item"
  # delete 'line_items/:id' => "line_items#destroy"
  # patch 'line_items'
  get '/line_items', to: "line_items#index" 
  post '/line_items', to: "line_items#create"
  resources :orders

  resources :phones, only: [:index, :show]

  post "/login", to: "sessions#login"
  post "/signup", to: "users#create"
  get '/authorized_user', to: 'users#show'
  delete '/logout', to: 'sessions#logout'

end
