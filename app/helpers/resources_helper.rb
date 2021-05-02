module ResourcesHelper
    def new_resource_link
        if @organization
            link_to("Add New Resource for #{@organization.name}", new_organization_resource_path(@organization), class: ["button"])
        else
            link_to("Add New Resource", new_resource_path, class: ["button"])
        end
    end

    def resource_list_index(object)
        if object.resources.empty?
            content_tag(:li, "No Resources Available")
        else
            object.resources.order(name: :asc).collect do |resource|
                link = link_to(resource.name, resource_path(resource))
                content_tag(:li, link)
            end.join.html_safe
        end
    end

    def resource_title
        text = "Funding Resources"
        if @organization
            text << "for #{@organization.name}"
        end
        content_tag(:h1, text, class: ["text-center"])
    end
end
