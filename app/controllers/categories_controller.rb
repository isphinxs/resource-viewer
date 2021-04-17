class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def show
        set_category
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
        set_category
    end

    def update
        set_category
        @category.update(category_params)
        redirect_to category_path(@category)
    end

    def destroy
    end

    private

    def set_category
        @category = Category.find_by(id: params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
    end
end
