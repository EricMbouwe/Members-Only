class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @users = User.all
  end

  def update

    @user = User.find(params[:id])
    @user.is_admin = params[:user][:is_admin]
    @user.is_member = params[:user][:is_member]
    if @user.save
      flash.notice = "User '#{@user.name}' successfully updated!"
    else
      flash.alert = "Update failed"
    end
    redirect_to users_path
  end

  def show
    @user = User.find(params[:user][:id])
  end


  def edit
    @user = User.find(params[:user][:id])

  end
end
