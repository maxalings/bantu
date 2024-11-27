class RequestsController < ApplicationController



  def new
    @request = Request.new()
  end

  def create
    @service = Service.find(params[:service_id])
    @request = Request.new(request_params)
    @request.status = "pending"
    @request.service = @service
    @request.user = current_user
    if @request.save
      flash[:notice] = "ok"
      redirect_to services_path
    else
      render "services/show", status: :unprocessable_entity 
      #need to work on error pop in, 
      ##mandatory fields
      #redirection
      #need to check on the duration regarding if it is a date or a slot tine (e.g. several days)
    end
  end


  private 
  def request_params
    params.require(:request).permit(:description, :date, :duration)
  end
end