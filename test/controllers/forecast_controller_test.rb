require "test_helper"

class ForecastControllerTest < ActionDispatch::IntegrationTest

  test "show with an input address" do
    address =  "1 Infinite Loop, Cupertino, California"
    get root_path, params: { address: address }
    assert_response :success
    assert_equal address, session[:address]
  end
end
