class Tag < ActiveRecord::Base
  validates :tag_text, presence: true
  has_and_belongs_to_many :posts
end
