class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    unless current_user.is_admin
      flash.alert = 'You must be an administrator to access users page'
      redirect_to root_path
    end
    @users = User.all
  end

  def update
    unless current_user.is_admin
      flash.alert = 'You must be an administrator to access users page'
      redirect_to root_path
    end

    @user = User.find(params[:id])
    @user.is_admin = params[:user][:is_admin]
    @user.is_member = params[:user][:is_member]
    if @user.save
      flash.notice = "User '#{@user.name}' successfully updated!"
    else
      flash.alert = 'Update failed'
    end
    redirect_to users_path
  end

  def show
    unless current_user.is_admin
      flash.alert = 'You must be an administrator to access users page'
      redirect_to root_path
    end
    @user = User.find(params[:user][:id])
  end

  def edit
    unless current_user.is_admin
      flash.alert = 'You must be an administrator to access users page'
      redirect_to root_path
    end
    @user = User.find(params[:user][:id])
  end
end
