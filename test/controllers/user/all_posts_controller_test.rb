require "test_helper"

class User::AllPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_all_posts_index_url
    assert_response :success
  end
end
