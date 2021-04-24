class ResourcesController < ApplicationController
    before_action :require_login

    def index
        if params[:organization_id]
            # byebug
            @organization = Organization.find_by(id: params[:organization_id])
            @resources = @organization.resources.order(name: :asc)
        else
            @resources = Resource.all.order(name: :asc)
        end
    end

    def show
       set_resource 
    end

    def new
        # byebug
        if params[:organization_id] && !Organization.exists?(params[:organization_id])
            redirect_to organizations_path, alert: "Organization not found."
        else
            @resource = Resource.new(organization_id: params[:organization_id])
            @categories = Category.all.order(name: :asc)
            @organizations = Organization.all.order(name: :asc)
        end
    end
    
    def create
        # byebug
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
        @categories = Category.all.order(name: :asc)
        @organizations = Organization.all.order(name: :asc)
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

    def organization_name
        self.organization ? self.organization.name : nil
    end
end
