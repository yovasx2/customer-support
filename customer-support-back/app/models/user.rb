class User < ApplicationRecord
  validates :email, presence: true
  validates :email, :password_digest, length: { maximum: 255 }
  validates :role,  inclusion: { in: %w(admin customer agent) }

  has_secure_password
end
