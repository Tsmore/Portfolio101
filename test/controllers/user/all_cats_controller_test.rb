require "test_helper"

class User::AllCatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_all_cats_index_url
    assert_response :success
  end
end
