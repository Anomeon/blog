class Tag < ActiveRecord::Base
  validates :tag_text, presence: true
  has_many :categories
  has_many :posts, through: :categories

  validates :tag_text, presence: :true
end
