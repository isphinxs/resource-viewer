class ResourcesController < ApplicationController
    before_action :require_login

    def index
        @resources = Resource.all
    end

    def show
       set_resource 
    end

    def new
        @resource = Resource.new
        @categories = Category.all
        @organizations = Organization.all
    end
    
    def create
        @resource = Resource.new(resource_params)
        if @resource.valid?
            @resource.save
            redirect_to resource_path(@resource)
        else
            @organizations = Organization.all
            @categories = Category.all
            render :new
        end
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
        if @resource.update(resource_params)
            redirect_to resource_path(@resource)
        else
            @categories = Category.all
            @organizations = Organization.all
            render :edit
        end
    end

    def destroy
        set_resource.destroy
        redirect_to resources_path
    end

    private

    def set_resource
        @resource = Resource.find_by(id: params[:id])
    end

    def resource_params
        params.require(:resource).permit(:name, :amount, :link, :description, :organization_id, organization_attributes: :name, category_ids: [], categories_attributes: [:name])
    end
end
