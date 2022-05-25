class PhonesController < ApplicationController
    def index 
        phones = Phone.all
        render json: phones,   status: :ok
    end

    def show
        phone = Phone.find(params[:id])
        render json: phone, status: :ok
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
