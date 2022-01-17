require "test_helper"

class TopPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get top_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get top_pages_help_url
    assert_response :success
  end
end
