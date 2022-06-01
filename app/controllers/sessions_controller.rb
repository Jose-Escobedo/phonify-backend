class SessionsController < ApplicationController
    # before_action :authorize_user, except: [:login]
    before_action :initialize_cart
    # before_action :cart
  
    def initialize_cart
        session[:cart_id] ||= []
    end
 
    def load_cart
       render json: $cart, status: :ok
    end
  
    def add_to_cart
        id = params[:phone_id].to_i
        session[:cart_id] << id unless session[:cart_id].include?(id)
        $cart = Phone.find(session[:cart_id]) 
        render json: $cart, status: :ok
    end

    def remove_from_cart
        id = params[:phone_id].to_i
        session[:cart_id].delete(id)
        render json: session[:cart_id], status: :ok
    end
    
    def add_quantity
        id = params[:phone_id].to_i
        $cart.map { |x| x.id == id ? x.quantity = x.quantity + 1  : x }
        render json: $cart, status: :ok
    end


    def login
        user = User.find_by(username:params[:username])
        
        if user&.authenticate(params[:password])

            session[:current_user] = user.id

            
            render json: user, status: :ok
        else



            render json: { error: "Invalid Password and/or Username" },  status: :unauthorized
        end
    end 

    def logout
        session.delete :current_user
    end 
end
