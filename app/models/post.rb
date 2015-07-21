class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
<<<<<<< HEAD
  has_one :summary
=======
  belongs_to :topic
>>>>>>> CP-40

  default_scope { order('created_at DESC')}
  scope :ordered_by_title, -> {where(post:true)}
  scope :ordered_by_reverse_created_at, -> {where(post: true)}

end
