class ServicesController < ApplicationController
  def index
    @services = Service.all
    # Add this new search condition
    if params[:query].present?
      @services = @services.where("title ILIKE :query OR description ILIKE :query", query: "%#{params[:query]}%")
    end

    # Existing filters remain unchanged
    @services = @services.where(category: params[:category]) if params[:category].present?
    @services = @services.where("price <= ?", params[:max_price]) if params[:max_price].present?
  end

  def show
    @service = Service.find(params[:id])
    @request = Request.new
  end
end
