require "test_helper"

class KitchenControllerTest < ActionController::TestCase
  before do
    sign_in create(:user)
  end

  test "should get board" do
    get :board
    assert_response :success
  end
end
