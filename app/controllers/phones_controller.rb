class PhonesController < ApplicationController
    def index 
        phones = Phone.all
        render json: phones,   status: :ok
    end

    def show
        phone = Phone.find(params[:id])
        render json: phone, status: :ok
    end

    def create
        phone = Phone.create(phone_params)
        render json: phone, status: :created
    end

    def update
        phone = Phone.find(params[:id])
        phone.update(phone_params)
        render json: phone, status: :accepted
    end

    def destroy
        product = Product.find(params[:id])
        product.destroy
    end
    
    private
    def phone_params
      params.require(:phone).permit(:name, :price, :desc, :image)
    end
    # def destroy
    #     favorite = Favorite.find(params[:id])
    #     favorite.destroy
    #     head :no_content
    # end

    # def create
    #     favorite = Favorite.create!(favorite_params)
    #     render json: favorite, status: :created
    # end

    # def update
    #     favorite = Favorite.find(params[:id])
    #     favorite.update!(favorite_params)
    #     render json: favorite, status: :ok
    # end

    # private

    # def favorite_params
    #     params.require(:favorite).permit(:team_id,:user_id  )
    # end


end
