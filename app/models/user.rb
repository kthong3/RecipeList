class User < ApplicationRecord
  validates :first_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  has_secure_password

  has_many :pinned_recipes
  has_many :recipes, through: :pinned_recipes
end
