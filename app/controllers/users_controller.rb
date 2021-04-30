class UsersController < ApplicationController
    before_action :require_authorization
    skip_before_action :require_authorization, only: [:new, :create]

    def show
        @user = current_user
        @ratings = @user.ratings.alphabetical_by_resource
        byebug
        # @ratings = @user.ratings
    end

    def new
        @user = User.new
    end

    def create
        # byebug
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        @user = User.find_by(id: session[:user_id])
    end

    def update
        @user = current_user
        if user_params[:password].blank?
            user_params.delete(:password)
            user_params.delete(:password_confirmation)
        end
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        # byebug
        current_user.destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    private
    
    def require_authorization
        return head(:forbidden) unless current_user == User.find_by(id: params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
end
