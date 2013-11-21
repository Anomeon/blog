class Comment < ActiveRecord::Base
  validates :body, length: { minimum: 1, maximum: 300 }
  belongs_to :post
  belongs_to :user
end
