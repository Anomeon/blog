class Tag < ActiveRecord::Base
  has_many :posts_tags_assignment, dependent: :destroy
  has_many :posts, through: :posts_tags_assignment

  validates :tag_text, presence: :true, length: { maximum: 30 }

end
