Rails.application.routes.draw do
  # get 'carts/:id',to: "carts#show"
  # delete 'carts/:id', to: "carts#destroy"

  
  # post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  # post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  # post 'line_items' => "line_items#create"
  # get 'line_items/:id' => "line_items#show", as: "line_item"
  # delete 'line_items/:id' => "line_items#destroy"
  # patch 'line_items'
  # get 'Cart' , to: "carts#index"
  # post 'Cart', to: "carts#create"
  post 'Cart/add_to_cart/:id', to: "carts#add_to_cart"
  delete 'Cart/add_to_cart/:id', to: "carts#remove_from_cart"
  resources :orders

  resources :phones, only: [:index, :show], param: :phone_id

  post "/login", to: "sessions#login"
  post "/signup", to: "users#create"
  get '/authorized_user', to: 'users#show'
  delete '/logout', to: 'sessions#logout'


  resources :carts, only: [:show], param: :cart_id
  resources :carts, only: [:create, :index]
  delete 'carts', to: 'carts#destroy'
  post 'carts/:cart_id/line_items/:phone_id', to: 'line_items#create'  
  patch 'carts/:cart_id/line_items/:phone_id', to: 'line_items#update'                        
  delete 'carts/:cart_id/line_items/:phone_id', to: 'line_items#destroy' 
  # /api/v1/carts/:cart_id/cart_items/:product_id

  # namespace 'api', defaults: { format: :json } do
  #   namespace 'v1' do
  #     resources :products, only: %i[index show], param: :product_id do
  #       collection { get 'in_stock' }
  #     end
      # resources :carts, only: [:show], param: :cart_id
      # resources :carts, only: [:create] do
      #   collection { post 'checkout' }
      #   resources :cart_items, only: %i[create update destroy],
      #                          param: :product_id
      # end
  #     root to: 'products#index'
  #   end
  # end
  # match '*path' => 'errors#render_not_found', via: :all

end
