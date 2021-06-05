class User < ApplicationRecord
  mount_uploader :profile_image, ImageUploader
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }
end
