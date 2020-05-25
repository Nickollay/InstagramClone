class Post < ApplicationRecord
  include ImageUploader::Attachment(:image) # adds an `image` virtual attribute

  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :content, presence: true, length: { maximum: 500}
  validates :image_data, presence: true
end
