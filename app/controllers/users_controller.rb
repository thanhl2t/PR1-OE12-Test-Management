class UsersController < ApplicationController
  def new
    @user = Users.new
  end

  def create
    @user = Users.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".success"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = Users.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".nouser"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:users).permit :user_name, :email, :password, :confirm
  end
end
