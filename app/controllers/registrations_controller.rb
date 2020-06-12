class RegistrationsController < Devise::RegistrationsController
  def create
    is_admin = User.all.count.zero?

    @user = User.new(sign_up_params)
    @user.is_admin = is_admin

    if @user.save
      redirect_to root_path
    else
      # flash.alert = "Invalid details"
      render :new
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
