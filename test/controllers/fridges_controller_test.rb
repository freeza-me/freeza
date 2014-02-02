require "test_helper"

class FridgesControllerTest < ActionController::TestCase

  before do
    sign_in @user = create(:user)
    @fridge = create(:fridge, user_id: @user.id)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:fridges)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Fridge.count') do
      post :create, fridge: attributes_for(:fridge)
    end

    assert_redirected_to fridge_path(assigns(:fridge))
  end

  def test_show
    get :show, id: @fridge
    assert_response :success
  end

  def test_edit
    get :edit, id: @fridge
    assert_response :success
  end

  def test_update
    put :update, id: @fridge, fridge: attributes_for(:fridge)
    assert_redirected_to fridge_path(assigns(:fridge))
  end

  def test_destroy
    assert_difference('Fridge.count', -1) do
      delete :destroy, id: @fridge
    end

    assert_redirected_to fridges_path
  end
end
