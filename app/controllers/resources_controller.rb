class ResourcesController < ApplicationController
    before_action :require_login
    before_action :set_resource, only: [:show, :edit, :update, :destroy]
    helper_method :nested_resource?

    def index
        if nested_resource?
            @organization = Organization.find_by(id: params[:organization_id])
            @resources = @organization.resources.alphabetical
        else
            @resources = Resource.alphabetical
        end
    end

    def show
        @rating = @resource.rating
    end
    
    def new
        if nested_resource? && !Organization.exists?(params[:organization_id])
            redirect_to organizations_path, alert: "Organization not found."
        else
            @resource = Resource.new(organization_id: params[:organization_id])
            @categories = Category.alphabetical
            @organizations = Organization.alphabetical
        end
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
        @categories = Category.alphabetical
        @organizations = Organization.alphabetical
    end
    
    def update
        if @resource.update(resource_params)
            redirect_to resource_path(@resource)
        else
            @categories = Category.all
            @organizations = Organization.all
            render :edit
        end
    end
    
    def destroy
        @resource.destroy
        redirect_to resources_path
    end
    
    private
    
    def nested_resource?
        params[:organization_id]
    end

    def set_resource
        @resource = Resource.find_by(id: params[:id])
    end

    def resource_params
        params.require(:resource).permit(:name, :amount, :link, :description, :organization_id, organization_attributes: :name, category_ids: [], categories_attributes: [:name])
    end
end
