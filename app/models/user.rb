class User < ApplicationRecord
  has_many :lists, dependent: :destroy

  has_secure_password

  validates_presence_of :email, :name, on: :create, message: "can't be blank"
  validates :email, uniqueness: true
  validates :name, length: { minimum: 3 }
  validates :password, length: { minimum: 10 }
end
