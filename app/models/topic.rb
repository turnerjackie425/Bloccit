class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :visible_to, -> (user) { user ? all : where(public: true) }

  validates :name, length: { minimum: 5 }, presence: true

  WillPaginate.per_page = 50
end
