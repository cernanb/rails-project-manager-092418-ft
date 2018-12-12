class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if params[:user][:password] == params[:user][:password_confirm]
            params[:user].delete(:password_confirm)
            user = User.new(user_params)
            if user.save
                session[:user_id] = user.id
                redirect_to projects_path
            else
                redirect_to new_user_path, alert: 'Could not create account!'
            end
        else
            redirect_to new_user_path, alert: 'Passwords must match!'
        end
    end


    private
        def user_params
            
            params.require(:user).permit(:username, :email, :password, :password_confirm)
        end
end
