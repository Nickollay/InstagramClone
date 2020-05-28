class User < ApplicationRecord
 devise :database_authenticatable, :registerable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
