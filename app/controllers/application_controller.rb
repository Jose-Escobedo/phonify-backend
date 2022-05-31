class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
  include ActionController::Cookies
  before_action :initialize_session
  before_action :load_cart


  # def current_user
  #     User.find_by(id: session[:current_user])
  # end


  # def authorize_user
  #     return render json: { error: "Not Authorized" }, status: :unauthorized unless current_user
  # end


  def initialize_session
    session[:cart] ||= []
  end


  def load_cart
    @cart = Phone.find(session[:cart])
  end


  # def current_customer
  #   if session[:user_id]
  #     @customer = Customer.find(session[:user_id])
  #   end
  # end

  # def current_cart
  #   if login?
  #     @cart = @customer.cart
  #   else
  #      if session[:cart]
  #       @cart = Cart.find(session[:cart])
  #      else
  #       @cart = Cart.create
  #       session[:cart] = @cart.id
  #      end
  #   end
  # end

  # def login?
  #   !!current_customer
  # end




  private

  def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  def render_not_found_response(invalid)
      render json: { errors: invalid }, status: :not_found
  end

end
