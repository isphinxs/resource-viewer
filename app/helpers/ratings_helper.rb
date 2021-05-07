module RatingsHelper
    def user_rating_or_form
        if @resource.users.include?(current_user)
            content_tag(:p, "Your Rating: #{@resource.ratings.find_by(user_id: current_user.id).rating}")
        else
            render partial: "ratings/form", locals: { resource: @resource }
        end
    end
end