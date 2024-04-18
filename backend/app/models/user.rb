class User < ApplicationRecord
  has_secure_password

  validates :email, :password, :name, presence: true
  validates :email, uniqueness: true
  validates :name, length: { maximum: 30 }
end
