class UsersController < ApplicationController
  def new
    @users = User.new
  end

  def create
    @users = User.create(user_params)

    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end
  private
　#ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
