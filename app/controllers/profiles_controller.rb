class ProfilesController < ApplicationController
  def show
    @user = current_user
    @requests = @user.requests
  end

end
