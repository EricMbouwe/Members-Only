class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def update

    @user = User.find(params[:id])
    @user.is_admin = params[:user][:is_admin]
    @user.is_member = params[:user][:is_member]
    if @user.save
      flash.notice = "User '#{@user.name}' successfully updated!"
      redirect_to users_path
    else
      flash.alert = "Update failed"
      redirect_to users_path
    end
  end

  def show
    @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])

  end
end
