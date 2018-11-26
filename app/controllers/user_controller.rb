class UserController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".nouser"
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".Sign_Up_Success"
      redirect_to @user
    else
      flash[:error] = t ".registration_failed"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :confirm
  end
end
