class Recipe < ApplicationRecord
  validates :title, presence: true
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :pinned_recipes

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, :default_style => :normal
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def editable
    Time.now < self.created_at + 1.hours
  end

end
