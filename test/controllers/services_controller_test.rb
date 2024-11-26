require "test_helper"

class ServicesControllerTest < ActionDispatch::IntegrationTest

  def index
    @services = Service.All
  end
end
