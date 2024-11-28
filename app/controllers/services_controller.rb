class ServicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @services = Service.all
    # Add this new search condition
    if params[:query].present?
      @services = @services.where("title ILIKE :query OR description ILIKE :query", query: "%#{params[:query]}%")
    end

    # Existing filters remain unchanged
    @services = @services.where(category: params[:category]) if params[:category].present?
    @services = @services.where("price <= ?", params[:max_price]) if params[:max_price].present?

    # The `geocoded` scope filters only flats with coordinates
    @markers = @services.geocoded.map do |service|
      {
        lat: service.latitude,
        lng: service.longitude
      }
    end

    @markers = @services.geocoded.map do |service|
      {
        lat: service.latitude,
        lng: service.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {service: service})
      }
    end
  end
  def show
    @service = Service.find(params[:id])
    @request = Request.new
  end

  def create
    @service = current_user.services.build(service_params)
    if @service.save
      flash[:notice] = 'Service was successfully created.'
      redirect_to dashboard_path
    else
      flash.now[:alert] = 'Failed to create service.'
      render 'workers/dashboard', status: :unprocessable_entity
    end
  end

  private

  def service_params
    params.require(:service).permit(:title, :category, :price, :description, :address)
  end
end
