require "test_helper"

class FoodsControllerTest < ActionController::TestCase

  before do
    @food = create(:food)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:foods)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Food.count') do
      post :create, food: {  }
    end

    assert_redirected_to food_path(assigns(:food))
  end

  def test_show
    get :show, id: @food
    assert_response :success
  end

  def test_edit
    get :edit, id: @food
    assert_response :success
  end

  def test_update
    put :update, id: @food, food: {  }
    assert_redirected_to food_path(assigns(:food))
  end

  def test_destroy
    assert_difference('Food.count', -1) do
      delete :destroy, id: @food
    end

    assert_redirected_to foods_path
  end
end
