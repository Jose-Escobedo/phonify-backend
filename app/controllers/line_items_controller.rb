class LineItemsController < ApplicationController
    def index 
        line_items = LineItem.all
        render json: line_items,   status: :ok
    end

    def show
        line_item = LineItem.find(params[:id])
        render json: line_item, status: :ok
    end


    def create
        # Find associated product and current cart
        chosen_phone = Phone.find(params[:phone_id])
        current_cart = @current_cart
      
        # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
        if current_cart.phones.include?(chosen_phone)
          # Find the line_item with the chosen_product
          @line_item = current_cart.line_items.find_by(:phone_id => chosen_phone)
          # Iterate the line_item's quantity by one
          @line_item.quantity += 1
        else
          @line_item = LineItem.new
          @line_item.cart = current_cart
          @line_item.phone = chosen_phone
        end
      
        # Save and redirect to cart show path
        @line_item.save
        render json: @line_item, status: :created
    end

    def update
        line_item = LineItem.find(params[:id])
        line_item.update(line_item_params)
        render json:line_item, status: :accepted
    end

    def destroy
      line_item = LineItem.find(params[:id])
      line_item.destroy
    end
    
    private
    def lineitem_params
      params.require(:line_item).permit(:quantity, :phone_id, :cart_id)
    end
end
