class UsersController < ApplicationController
    before_action :require_authorization
    skip_before_action :require_authorization, only: [:new, :create]
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def show
        @ratings = @user.ratings.alphabetical_by_resource
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    private
    
    def require_authorization
        return head(:forbidden) unless current_user == User.find_by(id: params[:id])
    end

    def set_user
        @user = current_user
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
end
