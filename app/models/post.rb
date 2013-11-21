class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :title, length: { minimum: 5, maximum: 160 }
  validates :text, length: { minimum: 5, maximum: 5000 }
end
