class WorkersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @services = @user.services
    @requests = Request.joins(:service).where(services: { user_id: @user.id })
  end

end
