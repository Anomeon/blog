class Tag < ActiveRecord::Base
  has_many :posts_tags_assigment, dependent: :destroy
  has_many :posts, through: :posts_tags_assigment

  validates :tag_text, presence: :true, length: { maximum: 30 }

end
