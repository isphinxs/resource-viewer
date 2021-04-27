class RatingsController < ApplicationController
    def create
        # byebug
        rating = Rating.new(user_id: current_user.id, resource_id: params[:resource_id], rating: params[:rating])
        if rating.valid?
            rating.save
            redirect_to resource_path(params[:resource_id])
        else
            render resource_path(params[:resource_id])
        end
    end

    private

    def ratings_params
        params.permit(:resource_id, :rating)
    end
end