class RequestsController < ApplicationController

  def new
    @request = Request.new()
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to services_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private 
  def request_params
    params.require(:request).permit(:description)
  end
end