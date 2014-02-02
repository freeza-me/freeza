require "test_helper"

# Add the following to your Rake file to test routes by default:
#   MiniTest::Rails::Testing.default_tasks << "routes"

class RouteTest < ActionDispatch::IntegrationTest
  def test_root
    assert_routing "/", controller: "home", action: "show"
  end

  def test_fridge
    user = create(:user)
    fridge = create(:fridge, user_id: user.id)

    assert_routing "/fridges",                   controller: "fridges", action: "index"
    assert_routing "/fridges/new",               controller: "fridges", action: "new"
    assert_routing "/fridges/#{fridge.id}",      controller: "fridges", action: "show", id: fridge.id.to_s
    assert_routing "/fridges/#{fridge.id}/edit", controller: "fridges", action: "edit", id: fridge.id.to_s
  end

  def test_foods
    user = create(:user)
    fridge = create(:fridge, user_id: user.id)
    food = create(:food, fridge_id: fridge.id)

    assert_routing "/fridges/#{fridge.id}/foods/new",
      fridge_id: fridge.id.to_s, controller: "foods", action: "new"

    assert_routing "/fridges/#{fridge.id}/foods/#{food.id}/edit",
      fridge_id: fridge.id.to_s, controller: "foods", action: "edit", id: food.id.to_s
  end
end
