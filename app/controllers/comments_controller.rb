class CommentsController < ApplicationController
  def create
    @comment = Comment.new if current_user?
    @post = Post.find(params[:id])
  end
end
