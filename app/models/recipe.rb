class Recipe < ApplicationRecord
  belongs_to :list
  validates :title, length: { minimum: 3, maximum: 30 }
  validates :ingredients, presence: true
  validates :instructions, presence: true
  validates :cooking_time, presence: true
end
