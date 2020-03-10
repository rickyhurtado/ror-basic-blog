require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @sports_blog = blogs(:sports)
    @sports_admin = users(:sports_admin)
    @sports_editor = users(:sports_editor)
    @nutrition_admin = users(:nutrition_admin)
    @nutrition_editor = users(:nutrition_editor)
    @private_admin = users(:private_admin)
  end

  test 'scope: belongs_to blog' do
    assert_equal(@sports_admin.blog.name, @sports_blog.name)
  end

  test 'scope: has_many :posts' do
    assert_equal(@sports_admin.posts.count, 1)
    assert_equal(@sports_editor.posts.count, 2)
    assert_equal(@nutrition_admin.posts.count, 2)
    assert_equal(@nutrition_editor.posts.count, 1)
    assert_equal(@private_admin.posts.count, 1)
  end

  test '#is_admin?' do
    assert(@sports_admin.is_admin?)
    assert_not(@sports_editor.is_admin?)
  end

  test '#is_editor?' do
    assert(@sports_admin.is_editor?)
    assert(@sports_editor.is_editor?)
  end
end
