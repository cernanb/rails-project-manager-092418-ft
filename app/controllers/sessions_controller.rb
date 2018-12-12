class SessionsController < ApplicationController

    def login

    end

    def create
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to projects_path
        else
            redirect_to login_path, alert: "You're stuck here!"
        end
    end
end
