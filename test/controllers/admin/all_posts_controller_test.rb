require "test_helper"

class Admin::AllPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_all_posts_index_url
    assert_response :success
  end
end
