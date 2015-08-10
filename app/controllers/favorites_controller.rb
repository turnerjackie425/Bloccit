class FavoritesController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize @favorites
    if favorite.save
      flash[:notice] = "Success."
      redirect_to [post.topic, post]
    else
      flash[:error] = "An error occured. Please try again."
      render :new
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.favorite(params[:id])
    authorize @favorites
    if favorite.destroy
      flash[:notice] = "Success."
      redirect_to [post.topic, post]
    else
      flash[:error] = "An error occured. Please try again."
      render :new
      redirect_to [post.topic, post]
    end
  end
end
