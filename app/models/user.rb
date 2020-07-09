class User < ApplicationRecord
 EMAIL_FORMAT = /[^@]+@[^\.]+\..+/

 devise :database_authenticatable, :registerable

 has_many :posts, dependent: :destroy
 has_many :comments, dependent: :destroy

 has_many :followers, through: :follower_follows, source: :follower
 has_many :follower_follows, foreign_key: :following_id, class_name: "Follow"

 has_many :followings, through: :following_follows, source: :follower
 has_many :following_follows, foreign_key: :follower_id, class_name: "Follow"

 validates :email, presence: true, uniqueness: true
 validates :email, format: { with: EMAIL_FORMAT}
 validates :name, presence: true
 validates :bio, presence: true

 private

 def admin?
  admin
 end

end
