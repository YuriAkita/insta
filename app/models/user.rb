class User < ApplicationRecord
  mount_uploader :profile_image, ImageUploader
end
