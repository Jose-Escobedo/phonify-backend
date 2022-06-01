class CartsController < ApplicationController


  def index
    carts = Cart.all
    render json: carts, status: :ok
  end


  def show
    
  end


  def create
    cart = Cart.create!
    render json: cart, status: :created
  end

  def destroy
    carts = Cart.all
    carts.destroy_all
  end




end
