class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
  include ActionController::Cookies

  before_action :current_cart

  def current_user
      User.find_by(id: session[:current_user])
  end


  def authorize_user
      return render json: { error: "Not Authorized" }, status: :unauthorized unless current_user
  end






  private

  def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  def render_not_found_response(invalid)
      render json: { errors: invalid }, status: :not_found
  end

  
  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      if cart
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
  end

  if session[:cart_id] == nil
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
  end
 end
end
