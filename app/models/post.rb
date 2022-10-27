class Post < ApplicationRecord
  has_many :comments 
  has_many :likes
  belongs_to :user
  around_save :update_counter_posts

  def five_most_recent_comments
    comments.last(5)
  end

  private
  
  def update_counter_posts
    user.update_counters [self.id], :posts_counter => user.posts.length
  end
end
