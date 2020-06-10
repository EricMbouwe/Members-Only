class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.is_member = params[:is_member]
    @user.save

  end

  def edit
    guard
    
    @user = User.find(:id)

  end
end
