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
    end

    def destroy
    end

    private

    def set_resource
        @resource = Resource.find_by(id: params[:id])
    end
end
