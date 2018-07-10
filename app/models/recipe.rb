class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :recipe_type
  validates :title, :difficulty, :cook_time, :ingredients, :cook_method, presence: true
  
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
