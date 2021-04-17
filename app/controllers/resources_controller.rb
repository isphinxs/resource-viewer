class ResourcesController < ApplicationController
    def index
        @resources = Resource.all
    end

    def show
       set_resource 
    end

    def new
    end
    
    def create
    end

    def edit
        set_resource
        # @category = self.categories.build
        @categories = Category.all
        @organizations = Organization.all
    end

    def update
        # byebug
        set_resource
        @resource.update(resource_params)
        redirect_to resource_path(@resource)
    end

    def destroy
    end

    private

    def set_resource
        @resource = Resource.find_by(id: params[:id])
    end

    def resource_params
        params.require(:resource).permit(:name, :amount, :link, :description, :organization_id, category_ids: [], categories_attributes: [:name])
    end
end
