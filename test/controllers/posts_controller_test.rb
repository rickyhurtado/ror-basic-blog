require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sports_post_1 = posts(:sports_post_1)
  end

  test '#show' do
    get post_url(@sports_post_1)
    assert_response :success
  end
end
