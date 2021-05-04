module PagesHelper
    def home_page_text
        if current_user && current_user.first_name
            content_tag(:div, class: "text-center") do 
                concat(
                    content_tag(:h3, "Welcome, #{current_user.first_name}!") + 
                    content_tag(:br) + 
                    link_to("Account", user_path(current_user), class: "button") +
                    render(partial: "logout_button")
                )
            end
        else
            content_tag(:div, class: "text-center") do 
                concat(
                    link_to("Sign Up", signup_path, class: "button") +
                    content_tag(:br) + 
                    link_to("Log In", login_path, class: "button")
                )
            end
        end
    end
end