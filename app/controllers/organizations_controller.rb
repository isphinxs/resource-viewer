class OrganizationsController < ApplicationController
    def index
        @organizations = Organization.all
    end

    def show
        set_organization
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end
    
    def destroy
    end

    private

    def set_organization
        @organization = Organization.find_by(id: params[:id])
    end
end
