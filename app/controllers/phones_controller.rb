class PhonesController < ApplicationController
    def index
        phones = Phone.all
        render json: phones, status: :ok
    end

    def show
        # validate_phone_id

        phone = Phone.find(params[:phone_id])

        render json: phone, status: :ok
    end

    # def create
    #     phone = Phone.create(phone_params)
    #     render json: phone, status: :created
    # end

    # def update
    #     phone = Phone.find(params[:id])
    #     phone.update(phone_params)
    #     render json: phone, status: :accepted
    # end

    # def destroy
    #     product = Product.find(params[:id])
    #     product.destroy
    # end
    
    private
    def phone_params
      params.require(:phone).permit(:name, :price, :desc, :image)
    end
end
