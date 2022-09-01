require "test_helper"

class FoodRecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get food_recipes_new_url
    assert_response :success
  end
end
