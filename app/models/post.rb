class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user, counter_cache: true

  def five_most_recent_comments
    comments.last(5)
  end
end
