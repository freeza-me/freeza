require "test_helper"

# Add the following to your Rake file to test routes by default:
#   MiniTest::Rails::Testing.default_tasks << "routes"

class RouteTest < ActionDispatch::IntegrationTest
  def test_root
    assert_routing "/", controller: "home", action: "show"
  end

  def test_foods
    food = create(:food)

    assert_routing "/foods",     controller: "foods", action: "index"
    assert_routing "/foods/new", controller: "foods", action: "new"
    assert_routing "/foods/#{food.id}", controller: "foods", action: "show", id: food.id.to_s
    assert_routing "/foods/#{food.id}/edit", controller: "foods", action: "edit", id: food.id.to_s
  end
end
