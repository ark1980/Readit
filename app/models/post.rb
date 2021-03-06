class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_one :summary
  belongs_to :user
  belongs_to :topic
  mount_uploader :image, ImageUploader

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  # validates :topic, presence: true
  # validates :user, presence: true

  scope :ordered_by_title, -> { order('title DESC') }

  scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }
end
