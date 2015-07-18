class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC')}
  scope :ordered_by_title, -> {where(post:true)}
  scope :ordered_by_reverse_created_at, -> {where(post: true)}

end
