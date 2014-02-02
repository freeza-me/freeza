require "test_helper"

class KitchenControllerTest < ActionController::TestCase
  test "should get board" do
    get :board
    assert_response :success
  end

end
