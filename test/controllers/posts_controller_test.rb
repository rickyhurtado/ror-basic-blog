require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sports_blog = blogs(:sports)
    @sports_post_1 = posts(:sports_post_1)
  end

  test '#by_blog' do
    get posts_by_blog_url(@sports_blog)
    assert_response :success
  end

  test '#show' do
    get post_url(@sports_post_1)
    assert_response :success
  end
end
