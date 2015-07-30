class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :comments, length: { minimum: 5 }, presence: true
  validates :body, presence: true
  validates :user, presence: true
end
