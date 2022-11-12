class Api::V1::PostsController < Api::V1::ApplicationController
  def index
    @user = User.find(params[:user_id])

    @posts = @user.posts.includes(comments: [:author])
    render json: @posts
  end

  def show
    @post = Post.includes(comments: [:author]).find(params[:id])

    render json: @post
  end
end
