require "test_helper"

class FoodsControllerTest < ActionController::TestCase

  before do
    sign_in @user = create(:user)
    @fridge = create(:fridge, user_id: @user.id)
    @food = create(:food, fridge_id: @fridge.id)
  end

  def test_new
    get :new, fridge_id: @fridge.id
    assert_response :success
  end

  def test_create
    assert_difference('Food.count') do
      post :create, food: attributes_for(:food), fridge_id: @fridge.id
    end

    assert_redirected_to kitchen_board_path
  end

  def test_edit
    get :edit, id: @food, fridge_id: @fridge.id
    assert_response :success
  end

  def test_update
    put :update, id: @food, food: attributes_for(:food), fridge_id: @fridge.id
    assert_redirected_to kitchen_board_path
  end

  def test_destroy
    assert_difference('Food.count', -1) do
      delete :destroy, id: @food, fridge_id: @fridge.id
    end

    assert_redirected_to kitchen_board_path
  end
end
