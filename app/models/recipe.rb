class Recipe < ApplicationRecord
  belongs_to :list
  validates :title, length: { minimum: 3, maximum: 30 }
  validates_presence_of :title, :ingredients, :instructions, :cooking_time
end
