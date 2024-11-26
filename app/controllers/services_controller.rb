class ServicesController < ApplicationController

  def index
    @services = Service.all

    # Apply category filter if present
    @services = @services.where(category: params[:category]) if params[:category].present?

    # Apply price filter if present
    @services = @services.where("price <= ?", params[:max_price]) if params[:max_price].present?
  end

end
