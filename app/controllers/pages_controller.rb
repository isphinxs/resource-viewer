class PagesController < ApplicationController
    def home
    end

    def route_not_found
        redirect_to root_path, alert: "URL not found. Please try again."
    end
end