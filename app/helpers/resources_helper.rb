module ResourcesHelper
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
