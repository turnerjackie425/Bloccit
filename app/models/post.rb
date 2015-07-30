class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  has_one :summary

  belongs_to :topic

  mount_uploader :image, ImageUploader

  default_scope { order('created_at DESC')}
  scope :ordered_by_title, -> {where(post:true)}
  scope :ordered_by_reverse_created_at, -> {where(post: true)}

  validates  :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

end
