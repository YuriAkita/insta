class User < ApplicationRecord
  mount_uploader :profile_image, ImageUploader
  validates :profile_image, presence: true
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },uniqueness: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :blogs
  has_many :favorites, dependent: :destroy
end
