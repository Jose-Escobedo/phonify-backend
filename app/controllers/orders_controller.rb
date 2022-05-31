class OrdersController < ApplicationController
    def index 
        orders = Order.all
        render json: orders,   status: :ok
    end

    def show
        order = Order.find(params[:id])
        render json: order, status: :ok
    end


    def create
      @order = Order.new(order_params)
      @current_order.line_items.each do |item|
        @order.line_items << item
        item.cart_id = nil
      end
      @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      render json: @order, status: :created
    end
    

    def update
        order = Order.find(params[:id])
        order.update(order_params)
        render json: order, status: :accepted
    end

    def destroy
        order = Order.find(params[:id])
        order.destroy
    end

    private

    def order_params
      params.require(:order).permit(:name, :email, :total, address, :phone_num)
    end
end
