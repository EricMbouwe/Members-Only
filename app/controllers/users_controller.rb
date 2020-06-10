class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def update

    @user = User.find(params[:id])
    @user.is_admin = params[:user][:is_admin]
    @user.is_member = params[:user][:is_member]
    @user.save


    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
  end


  def edit
    # byebug

    @user = User.find(params[:id])

  end
end
