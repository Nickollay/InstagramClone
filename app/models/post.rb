class Post < ApplicationRecord
  include ImageUploader::Attachment(:image) # adds an `image` virtual attribute

  has_many :comments, dependent: :destroy

  validates :content, presence: true
  validates :image_data, presence: true
end
