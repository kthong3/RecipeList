class Recipe < ApplicationRecord
  validates :title, presence: true
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :pinned_recipes

  def editable
    Time.now < self.created_at + 1.hours
  end

end
