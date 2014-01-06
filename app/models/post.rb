class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :tags, through: :categories

  validates :title, length: { minimum: 5, maximum: 160 }
  validates :text, length: { minimum: 5, maximum: 5000 }
end
