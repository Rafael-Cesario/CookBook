class User < ApplicationRecord
  has_many :lists
  has_secure_password
  validates :email, :password, :name, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 10..30 }
  validates :name, length: { maximum: 20 }

  before_validation :downcase_fields

  def downcase_fields
    self.email.downcase!
    self.name.downcase!
  end
end
