class ResourcesController < ApplicationController
    before_action :require_login
    helper_method :nested_resource?

    def index
        if nested_resource?
            # byebug
            @organization = Organization.find_by(id: params[:organization_id])
            @resources = @organization.resources.alphabetical
        else
            @resources = Resource.alphabetical
        end
    end

    def show
       set_resource
    #    @average_rating = Rating.average_rating(@resource.id) 
        average_rating
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
        @categories = Category.alphabetical
        @organizations = Organization.alphabetical
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
    
    def average_rating
        @average_rating = Rating.average_rating(@resource.id).first.avg_rating 
        # byebug
        if @average_rating.nil?
            @average_rating = "n/a"
        end
    end
    
    def nested_resource?
        params[:organization_id]
    end

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
