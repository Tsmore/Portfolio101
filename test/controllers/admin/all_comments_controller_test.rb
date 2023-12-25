require "test_helper"

class Admin::AllCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_all_comments_index_url
    assert_response :success
  end
end
