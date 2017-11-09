class User < ApplicationRecord
  has_secure_password

  has_many  :pinned_recipes
  has_many :recipes, through: :pinned_recipes
end
