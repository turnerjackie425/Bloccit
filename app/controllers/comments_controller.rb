class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post= Post.find(params[:post_id])
    @comment = Comment.new(params.require(:post))
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@comment, @post]
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
  end

  def comment_params
    params.require(:comment).permit(body: string)
  end 
  end 
end
