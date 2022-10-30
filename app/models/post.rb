class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :author, class_name: 'User'
  after_create :update_post_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def five_most_recent_comments
    comments.last(5)
  end

  private

  def update_post_counter
    author.update(posts_counter: author.posts.length)
  end
end
