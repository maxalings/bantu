class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to services_path
    else
      render :new, status: :unprocessable_entity
      #need to work on error pop in, mandatory fields, stimulus for form
    end
  end


  private
  def request_params
    params.require(:request).permit(:description)
  end
end
