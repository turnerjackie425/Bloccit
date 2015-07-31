class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user

  has_one :summary

  belongs_to :topic

  mount_uploader :image, ImageUploader

  default_scope { order('rank DESC')}
  scope :ordered_by_title, -> {where(post:true)}
  scope :ordered_by_reverse_created_at, -> {where(post: true)}

  validates  :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  # validates :topic, presence: true
  # validates :user, presence: true

  after_create :create_vote
  
  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points(sum)
    sum = up_votes + down_votes
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970, 1, 1)) / (60 * 60 * 24) 
    mew_rank = points + age_in_days

    update_attribute(:rank, new_rank)
  end

  private

  def create_vote
    user.votes.create(@post = post.value(1))
  end
end
