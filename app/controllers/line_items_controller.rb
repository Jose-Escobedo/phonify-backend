class LineItemsController < ApplicationController
  def create
    # ensures that all the required parameters are there and exist
    # in the database.
    validate_phone_id
    validate_cart_id
    validate_item_quantity

    cart = Cart.find(params[:cart_id])
    cart.add_product(params[:phone_id], params[:quantity])

    render json: { status: 'SUCCESS', message: 'Item added to cart.' },
           status: :created
  end

  # Updates the quantity for an item in a cart
  # PUT    /api/v1/carts/:cart_id/cart_items/:product_id
  # PATCH  /api/v1/carts/:cart_id/cart_items/:product_id
  # body ex:
  # {
  #   "item_quantity": 5
  # }
  def update
    # ensures that all the required parameters are there and exist
    # in the database
    validate_phone_id
    validate_cart_id
    validate_item_quantity

    cart = Cart.find(params[:cart_id])
    cart.update_cart_item(params[:phone_id], params[:quantity])

    render json: cart, status: :ok
  end

  # Removes an item from a cart. If the item doesn't exist or the cart
  # doesn't exist then an error is raised
  # DELETE /api/v1/carts/:cart_id/cart_items/:product_id
  def destroy
    # ensures that all the required parameters are there and exist
    # in the database
    validate_phone_id
    validate_cart_id
    validate_line_item

    line_item = LineItem.find_by!(phone_id: params[:phone_id],
                                  cart_id: params[:cart_id])
    line_item.destroy!

    render json: cart, status: :ok
  end

  private

  # Ensures the item quantity is passed with the request
  def validate_item_quantity
    params.require(:quantity)
  end

  # Ensures that the item exists in the cart
  def validate_line_item
    line_item = LineItem.find_by(phone_id: params[:phone_id])
    if line_item.nil?
      raise ArgumentError, 'The item does not exist in the cart'
    end
  end
    
    private
    def order_params
      params.require(:line_item).permit(:quantity, :phone_id)
    end
end
