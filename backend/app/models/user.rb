class User < ApplicationRecord
  has_secure_password

  validates :email, :password, :name, presence: true
  validates :email, uniqueness: { message: "duplicated: Email already in use."}
  validates :name, length: { maximum: 30 }

  before_save :downcase_email

  protected

  def downcase_email
    self.email = self.email.downcase
  end
end
