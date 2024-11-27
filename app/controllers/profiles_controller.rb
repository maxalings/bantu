class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    # @requests = @user.requests
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation, :role)
  end

end
