class OrganizationsController < ApplicationController
    before_action :require_login
    before_action :set_organization, only: [:show, :edit, :update, :destroy]

    def index
        @organizations = Organization.alphabetical
    end

    def show
        @total_funding = @organization.find_total_funding
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
    end

    def update
        if @organization.update(organization_params)
            redirect_to organization_path(@organization)
        else
            render :edit
        end
    end
    
    def destroy
        @organization.destroy
        redirect_to organizations_path
    end

    private

    def set_organization
        @organization = Organization.find_by(id: params[:id])
        if @organization.nil?
            redirect_to organizations_path, alert: "Organization not found."
        end
    end

    def organization_params
        params.require(:organization).permit(:name)
    end

end
