class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".success"
      redirect_to "/login"
    else
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".nouser"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit :user_name, :email, :password, :confirm
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "please_login"
    redirect_to login_url
  end
end

module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end
end