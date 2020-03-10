class Post < ApplicationRecord
  PRIVACY_PUBLIC = 'public'
  PRIVACY_PRIVATE = 'private'

  belongs_to :user
  belongs_to :blog

  def self.all_public
    self.joins_blogs(PRIVACY_PUBLIC)
  end

  def self.all_private
    self.joins_blogs(PRIVACY_PRIVATE)
  end

  def self.all_public_posts_by_blog(blog_id)
    self.joins(:blog).where(['blogs.privacy="', PRIVACY_PUBLIC, '"'].join)
                     .where('blog_id="?"', blog_id)
  end

  private

  def self.joins_blogs(privacy)
    self.joins(:blog).where(['blogs.privacy="', privacy, '"'].join)
  end
end
