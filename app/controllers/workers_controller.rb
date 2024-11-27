class WorkersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @services = @user.services
  end
end
