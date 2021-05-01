class SessionsController < ApplicationController
  def new
    if session[:user_id]
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Invalid username or password."
      redirect_to login_path
    end
  end

  def omniauth
    user_info = request.env["omniauth.auth"]
    user = User.find_or_create_by(uid: user_info["uid"], provider: user_info["provider"]) do |u|
      u.first_name = user_info["info"]["first_name"]
      u.last_name = user_info["info"]["last_name"]
      u.email = user_info["info"]["email"]
      u.username = user_info["info"]["email"]
      u.password = SecureRandom.hex(10)
    end
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_path
  end
end
