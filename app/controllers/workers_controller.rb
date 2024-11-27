class WorkersController < ApplicationController

  def show
    @user = current_user
    @services = Service.where(user_id: @user.id)
  end
end
