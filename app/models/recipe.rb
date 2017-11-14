class Recipe < ApplicationRecord
  validates :title, presence: true
  has_many :pinned_recipes
end
