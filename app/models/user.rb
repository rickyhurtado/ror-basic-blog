class User < ApplicationRecord
  ROLE_ADMIN = 'admin'
  ROLE_EDITOR = 'editor'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :email, uniqueness: true

  belongs_to :blog
  has_many :posts

  def is_admin?
    self.role.eql?(ROLE_ADMIN)
  end

  def is_editor?
    [ROLE_ADMIN, ROLE_EDITOR].include?(self.role)
  end
end
