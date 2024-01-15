class List < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :title, length: { minimum: 3, maximum: 30 }
end
