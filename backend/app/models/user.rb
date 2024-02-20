class User < ApplicationRecord
  has_secure_password
  validates :email, :password, :name, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 10..30 }
  validates :name, length: { maximum: 20 }
end
