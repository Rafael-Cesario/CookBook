class Recipe < ApplicationRecord
  has_one_attached :cover
  belongs_to :list
  validates :title, :ingredients, :instructions, :cooking_time, :list_id, presence: true
  validates :title, length: { maximum: 100 }
end
