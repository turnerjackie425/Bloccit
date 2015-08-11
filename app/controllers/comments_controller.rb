class CommentsController < ApplicationController
  def create
    
    @post= Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:body))
    redirect_to post_path(@post)

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@comment, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    authorize @comments
  end

  def destroy
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end


  def comment_params
    params.require(:comment).permit(body: string)
  end 
  end 
end
