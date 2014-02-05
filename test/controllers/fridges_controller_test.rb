require "test_helper"

class FridgesControllerTest < ActionController::TestCase

  before do
    sign_in @user = create(:user)
    @fridge = create(:fridge, user_id: @user.id)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Fridge.count') do
      post :create, fridge: attributes_for(:fridge)
    end

    assert_redirected_to kitchen_board_path
  end

  def test_edit
    get :edit, id: @fridge
    assert_response :success
  end

  def test_update
    put :update, id: @fridge, fridge: attributes_for(:fridge)
    assert_redirected_to kitchen_board_path
  end

  def test_destroy
    assert_difference('Fridge.count', -1) do
      delete :destroy, id: @fridge
    end

    assert_redirected_to kitchen_board_path
  end

  def test_inbound
    assert_difference('Food.count') do
      post :inbound, mandrill_events: { event: 'inbound', msg: { to: [[@fridge.inbound_address,nil]], subject: 'Test Food' } }.to_json
    end
    assert_response :success
  end
end
