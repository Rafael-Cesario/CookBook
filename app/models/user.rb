class User < ApplicationRecord
  has_many :lists, dependent: :destroy
  validates :email, uniqueness: true, presence: true
  validates :name, length: { minimum: 3 }
  validates :password, length: { minimum: 10 }, presence: true
  has_secure_password
end
