require "test_helper"

class User::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_items_index_url
    assert_response :success
  end
end
