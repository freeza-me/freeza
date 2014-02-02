require "test_helper"

class FoodsControllerTest < ActionController::TestCase

  before do
    sign_in @user = create(:user)
    @fridge = create(:fridge, user_id: @user.id)
    @food = create(:food, fridge_id: @fridge.id)
  end

  def test_index
    get :index, fridge_id: @fridge.id
    assert_response :success
    assert_not_nil assigns(:foods)
  end

  def test_new
    get :new, fridge_id: @fridge.id
    assert_response :success
  end

  def test_create
    assert_difference('Food.count') do
      post :create, food: attributes_for(:food), fridge_id: @fridge.id
    end

    assert_redirected_to fridge_food_path(assigns(:food), fridge_id: @fridge.id)
  end

  def test_show
    get :show, id: @food, fridge_id: @fridge.id
    assert_response :success
  end

  def test_edit
    get :edit, id: @food, fridge_id: @fridge.id
    assert_response :success
  end

  def test_update
    put :update, id: @food, food: attributes_for(:food), fridge_id: @fridge.id
    assert_redirected_to fridge_food_path(assigns(:food), fridge_id: @fridge.id)
  end

  def test_destroy
    assert_difference('Food.count', -1) do
      delete :destroy, id: @food, fridge_id: @fridge.id
    end

    assert_redirected_to fridge_foods_path(fridge_id: @fridge.id)
  end
end
