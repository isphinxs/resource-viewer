class OrganizationsController < ApplicationController
    before_action :require_login

    def index
        @organizations = Organization.all.order(name: :asc)
    end

    def show
        set_organization
    end

    def new
        @organization = Organization.new
    end

    def create
        @organization = Organization.new(organization_params)
        if @organization.valid?
            @organization.save
            redirect_to organization_path(@organization)
        else
            render :new
        end
    end

    def edit
        set_organization
    end

    def update
        set_organization
        if @organization.update(organization_params)
            redirect_to organization_path(@organization)
        else
            render :edit
        end
    end
    
    def destroy
        set_organization.destroy
        redirect_to organizations_path
    end

    private

    def set_organization
        @organization = Organization.find_by(id: params[:id])
    end

    def organization_params
        params.require(:organization).permit(:name)
    end
end
