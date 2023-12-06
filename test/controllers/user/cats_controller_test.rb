require "test_helper"

class User::CatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_cats_index_url
    assert_response :success
  end
end
