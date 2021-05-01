class CategoriesController < ApplicationController
    before_action :require_login
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
        @categories = Category.alphabetical
    end

    def show
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.valid?
            @category.save
            redirect_to category_path(@category)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @category.update(category_params)
            redirect_to category_path(@category)
        else
            render :edit
        end
    end

    def destroy
        @category.destroy
        redirect_to categories_path
    end

    private

    def set_category
        @category = Category.find_by(id: params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
    end
end
