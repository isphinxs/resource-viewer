class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # byebug
        user = User.new(user_params)
        if user.valid?
            user.save
            redirect_to root_path
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
end
