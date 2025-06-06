module Api
    class WishlistsController < ApplicationController
        protect_from_forgery with: :null_session
        # before_action :authenticate_user!

        def create
            wishlist = Wishlist.create!(wishlist_params)
            respond_to do |format|
                format.json { render json: wishlist, status: :created }
            end
        end

        def destroy
            wishlist = Wishlist.find(params[:id])
            wishlist.destroy!
            respond_to do |format|
                format.json { render json: wishlist, status: :ok }
            end
        end

        private

        def wishlist_params
            params.permit(:property_id, :user_id)
        end
    end
end
