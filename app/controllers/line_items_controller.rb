class LineItemsController < ApplicationController
    def index 
        @line_items = LineItem.all
        render json: @line_items,   status: :ok
    end

    def show
        @line_item = LineItem.find(params[:id])
        render json: @line_item, status: :ok
    end

    def create
      @cart = Cart.find(params[:id])
      @customer = Customer.find(params[:id])
      render json: @customer.cart, status: :created
    end


    # def create
    #     @order = current_order
    #     @line_item = @order.line_items.new(order_params)
    #     @order.save
    #     session[:order_id]= @order.id
    #     if @order.save
    #       render json: @order.line_items, status: :created
    #     else
    #       render json: @order.line_items, status: :unprocessable_entity
    #     end
    # end

    # def update
    #     @order = current_order
    #     @line_item = @order.line_items.find(params[:id])
    #     @line_item.update_attributes(order_params)
    #     @line_items = current_order.line_items
    # end

    # def destroy
    #   @order = current_order
    #   @line_item = @order.line_items.find(params[:id])
    #   @line_item.destroy
    #   @line_items = current_order.line_items
    # end
    
    private
    def order_params
      params.require(:line_item).permit(:quantity, :phone_id)
    end
end
