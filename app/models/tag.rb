class Tag < ActiveRecord::Base
  has_many :categories, dependent: :destroy
  has_many :posts, through: :categories

  validates :tag_text, presence: :true, length: { maximum: 30 }

end
