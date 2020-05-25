class User < ApplicationRecord
 devise :database_authenticatable, :registerable

  has_many :posts
  has_many :comments

  validates :email, presence: true, uniqueness: true
end
