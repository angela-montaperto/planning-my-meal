require "test_helper"

class FoodGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get food_groups_new_url
    assert_response :success
  end

  test "should get create" do
    get food_groups_create_url
    assert_response :success
  end
end
