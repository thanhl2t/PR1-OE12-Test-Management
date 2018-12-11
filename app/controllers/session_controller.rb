class SessionController < ApplicationController
  def new; end

  def create
    user = User.find_by user_name: params[:session][:user_name].downcase
    if user
      log_in user
      redirect_to '/exam/filter_show'
    else
      flash.now[:danger] = t ".invalid"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
