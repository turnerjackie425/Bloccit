class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :visible_to(:publicly_viewable) 
   
  scope :publicly_viewable, -> (user) { user ? all : where(public: true) }

  scope :privately_viewable, -> (user) { user ? all : where(public: false) }

  validates :name, length: { minimum: 5 }, presence: true

  WillPaginate.per_page = 50
end
