class List < ApplicationRecord
  belongs_to :user
  validates :user_id, :title, presence: true
  validates :title, length: { maximum: 100 }
end
