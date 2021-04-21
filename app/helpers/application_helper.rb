module ApplicationHelper
    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
end
