require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
    test "postsのindexページが表示される" do
    get posts_url
    assert_response :success
  end
end
