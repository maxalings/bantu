class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if params[:user][:avatar].present?
      uploaded_file = params[:user][:avatar]
      cloudinary_file = Cloudinary::Uploader.upload(uploaded_file.tempfile.path)
      @user.avatar = cloudinary_file['url']
    end

    if @user.update(user_params)
      redirect_to profile_path, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end

end
