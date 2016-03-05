class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    if current_user.admin?
      redirect_to admin_dashboard_path(current_user.id)
    else
      @user = current_user
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end
end
