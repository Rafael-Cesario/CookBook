class List < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :user_id, :title, presence: true
  validates :title, length: { maximum: 100 }
end
