module ApplicationHelper

    def logged_in? 
        !!current_user
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def authenticate
        redirect_to login_path if !logged_in?
    end
end
