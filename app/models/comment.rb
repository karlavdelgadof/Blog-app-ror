class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  around_save :update_counter_comments


  private
  
  def update_counter_comments
    post.update_counters [self.id], :comments_counter => post.comments.length
  end
end
