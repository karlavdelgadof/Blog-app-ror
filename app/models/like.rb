class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  around_save :update_counter_likes


  private
  
  def update_counter_likes
    post.update_counters [self.id], :likes_counter => post.likes.length
  end
end
