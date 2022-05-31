class CartsController < ApplicationController
  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    render json: session[:cart], status: :ok
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    render json: session[:cart], status: :ok
  end

  def index
    render json: @cart, status: :ok
  end
end
