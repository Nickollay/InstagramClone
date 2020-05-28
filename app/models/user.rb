class User < ApplicationRecord
 EMAIL_FORMAT = /[^@]+@[^\.]+\..+/

 devise :database_authenticatable, :registerable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: EMAIL_FORMAT}
  validates :name, presence: true
  validates :bio, presence: true

end
