class PostsController < ApplicationController
  def index
    @user = User.find(params[:author_id])
    @posts = Post.where(author_id: params[:author_id])
  end

  def show
    @user = User.find(params[:author_id])
    @post = Post.find(params[:id])
  end
end
