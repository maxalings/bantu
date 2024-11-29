class WorkersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service, only: [:update_service, :destroy_service]

  def show
    @worker = User.find(params[:id])
    @show_number = @worker.services
                          .map(&:requests)
                          .flatten
                          .select { |request| request.user_id == current_user.id && request.status == "accepted" }
                          .present?
  end

  def dashboard
    @user = current_user
    @services = current_user.services.order(created_at: :desc)
    status_filter = params[:status] || "pending" # par défaut "pending"
    @requests = Request.joins(:service).where(services: { user_id: @user.id }, status: status_filter)
  end

  def update_service
    if @service.update(service_params)
      flash[:notice] = 'Service was successfully updated.'
      redirect_to dashboard_path
    else
      flash[:alert] = 'Error updating service.'
      redirect_to dashboard_path
    end
  end

  def destroy_service
    if @service.destroy
      flash[:notice] = 'Service was successfully deleted.'
    else
      flash[:alert] = 'Failed to delete service.'
    end
    redirect_to dashboard_path
  end

  def create_service
    @service = current_user.services.build(service_params)
    if @service.save
      flash[:notice] = 'Service was successfully created.'
    else
      flash[:alert] = 'Failed to create service.'
    end
    redirect_to dashboard_path
  end

  private

  def set_service
    @service = current_user.services.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :category, :price, :description)
  end
end
