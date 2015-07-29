class Topic < ActiveRecord::Base
  has_many :posts

  validates :name, length: { minimum: 5 }, presence: true

  WillPaginate.per_page = 50
end
