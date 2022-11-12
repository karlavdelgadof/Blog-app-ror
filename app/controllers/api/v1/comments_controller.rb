class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])

    @comments = @post.comments

    render json: @comments
  end

  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comment = Comment.create(params.require(:comment).permit(:text))
    @comment.author = @user
    @comment.post = @post

    if @comment.save
      render json: @comment
    else
      head :not_found
    end
  end
end
