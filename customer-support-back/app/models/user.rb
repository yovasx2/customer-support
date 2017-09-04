class User < ApplicationRecord
  validates :email, presence: true
  validates :email, :password_digest, length: { maximum: 255 }

  has_secure_password
end
