class OrganizationsController < ApplicationController
    before_action :require_login

    def index
        @organizations = Organization.all
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
        @organization.update(organization_params)
        redirect_to organization_path(@organization)
    end
    
    def destroy
    end

    private

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def set_organization
        @organization = Organization.find_by(id: params[:id])
    end

    def organization_params
        params.require(:organization).permit(:name)
    end
end
