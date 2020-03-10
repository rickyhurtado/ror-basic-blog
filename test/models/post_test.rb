require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @sports_post_1 = posts(:sports_post_1)
    @sports_post_2 = posts(:sports_post_2)
    @nutrition_post_1 = posts(:nutrition_post_1)
    @nutrition_post_3 = posts(:nutrition_post_3)
    @private_post = posts(:private_post)
    @sports_admin = users(:sports_admin)
    @sports_editor = users(:sports_editor)
    @nutrition_admin = users(:nutrition_admin)
    @nutrition_editor = users(:nutrition_editor)
    @private_admin = users(:private_admin)
    @sports_blog = blogs(:sports)
    @nutrition_blog = blogs(:nutrition)
    @private_blog = blogs(:private)
  end

  test 'belongs_to :user' do
    assert_equal(@sports_post_1.user, @sports_admin)
    assert_equal(@sports_post_2.user, @sports_editor)
    assert_equal(@nutrition_post_1.user, @nutrition_admin)
    assert_equal(@nutrition_post_3.user, @nutrition_editor)
    assert_equal(@private_post.user, @private_admin)
  end

  test 'belongs_to :blog' do
    assert_equal(@sports_post_1.blog, @sports_blog)
    assert_equal(@sports_post_2.blog, @sports_blog)
    assert_equal(@nutrition_post_1.blog, @nutrition_blog)
    assert_equal(@nutrition_post_3.blog, @nutrition_blog)
    assert_equal(@private_post.blog, @private_blog)
  end

  test '.all_public' do
    assert_equal(Post.all_public.count, 6)
  end

  test '.all_private' do
    assert_equal(Post.all_private.count, 1)
  end

  test '.all_public_posts_by_blog' do
    assert_equal(Post.all_public_posts_by_blog(@sports_blog.id).count, 3)
    assert_equal(Post.all_public_posts_by_blog(@nutrition_blog.id).count, 3)
    assert_equal(Post.all_public_posts_by_blog(@private_blog.id).count, 0)
  end
end
