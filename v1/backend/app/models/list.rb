class List < ApplicationRecord
  belongs_to :user
  has_many :recipes, dependent: :destroy

  validates :user_id, :title, presence: true
  validates :title, length: { maximum: 100 }
end
