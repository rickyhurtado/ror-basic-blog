require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  setup do
    @sports_blog = blogs(:sports)
    @nutrition_blog = blogs(:nutrition)
    @private_blog = blogs(:private)
  end

  test 'has_many :users' do
    assert_equal(@sports_blog.posts.count, 3)
    assert_equal(@nutrition_blog.posts.count, 3)
    assert_equal(@private_blog.posts.count, 1)
  end

  test '#is_public?' do
    assert(@sports_blog.is_public?)
    assert(@nutrition_blog.is_public?)
    assert_not(@private_blog.is_public?)
  end

  test '#is_private?' do
    assert(@private_blog.is_private?)
    assert_not(@sports_blog.is_private?)
    assert_not(@nutrition_blog.is_private?)
  end
end
