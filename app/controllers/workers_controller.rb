class WorkersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @services = @user.services
    status_filter = params[:status] || "pending" # par défaut "pending"
    @requests = Request.joins(:service).where(services: { user_id: @user.id }, status: status_filter)
  end

end
