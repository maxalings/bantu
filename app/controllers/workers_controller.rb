class WorkersController < ApplicationController
  before_action :authenticate_user!

  def show
    @worker = User.find(params[:id])
    @show_number = @worker.services.map(&:requests).flatten.any? { |r| r.user_id == current_user.id }
  end

  def dashboard
    @user = current_user
    @services = @user.services
  end
end
