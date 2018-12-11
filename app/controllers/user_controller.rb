class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".welcome"
      redirect_to @user
    else
      flash[:error] = t ".failed"
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".nouser"
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def index
    @user = User.paginate(page: params[:page])
  end

  private

  def load_user
      @user = User.find_by id: params[:id]
      return if @user
      flash[:danger] = t ".no_user"
    end

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
