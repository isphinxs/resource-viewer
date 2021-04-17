class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def show
        set_category
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_category
        @category = Category.find_by(id: params[:id])
    end
end
