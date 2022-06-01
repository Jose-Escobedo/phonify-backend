class LineItemsController < ApplicationController
  def create
    cart = Cart.find(session[:cart_id])
    cart.add_product(params[:id], session[:cart_id])

    render json: { status: 'SUCCESS', message: 'Item added to cart.' },
           status: :created
  end

  def update

  end

  def destroy

  end

    private
    def line_item_params
      params.require(:line_item).permit(:quantity, :phone_id)
    end
end
