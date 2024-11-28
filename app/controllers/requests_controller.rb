class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find[:id]
    redirect_to request_path
  end


  def new
    @request = Request.new
  end

  def create
    @service = Service.find(params[:service_id])
    @request = Request.new(request_params)
    @request.status = "pending"
    @request.service = @service
    @request.user = current_user
    if @request.save
      flash[:notice] = "You request has been sent "
      redirect_to services_path
    else
      render "services/show", status: :unprocessable_entity
    end
  end

  private
  def request_params
    params.require(:request).permit(:description, :date, :duration)
  end
end
