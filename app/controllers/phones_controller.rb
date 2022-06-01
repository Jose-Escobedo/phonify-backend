class PhonesController < ApplicationController

 

    def index
        phones = Phone.all
        render json: phones, status: :ok
    end

    def show

        phone = Phone.find(params[:phone_id])

        render json: phone, status: :ok
    end

 
  
    
    private

    def phone_params
      params.require(:phone).permit(:name, :price, :desc, :image)
    end
end
