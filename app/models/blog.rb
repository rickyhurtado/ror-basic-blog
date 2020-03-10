class Blog < ApplicationRecord
  PRIVACY_PUBLIC = 'public'
  PRIVACY_PRIVATE = 'private'

  has_many :users
  has_many :posts

  def is_public?
    self.privacy.eql?(PRIVACY_PUBLIC)
  end

  def is_private?
    self.privacy.eql?(PRIVACY_PRIVATE)
  end
end
